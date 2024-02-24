#include <stdio.h>
#include <stdlib.h>

#if defined(__linux__) || defined(__MINGW32__)
#include <unistd.h>
#include <getopt.h>
#include <time.h>
#endif

#if defined(__MINGW32__) && defined(AUDIO_EN)
#include <windows.h>
#include <mmsystem.h>
#endif

#if defined(__linux__) && defined(AUDIO_EN)
#include "audio/linux_audio.h" 
#include <pthread.h>
#endif

#include "frames.h"
#include "rat.h"

int opt, rainbow_flag, ratmark_flag, unlock_flag, debug_flag, loop_count;

void print_help() {
    printf("Usage: rat [OPTIONS]\n");
    printf("Options:\n");
    printf("  -r, --rainbow     Enable rainbow mode\n");
    printf("  -m, --ratmark     Enable ratmark\n");
    printf("                    depends - lolcat\n");
    printf("  -u, --unlock      Enable framerate unlock\n");
    printf("  -d, --debug       Enable debug mode\n");
    printf("  -h, --help        Display this help menu\n");
}

void print_debug() {
    if(debug_flag) {
        if(rainbow_flag) {
            printf("Rainbow enabled\n");
        }
        if(ratmark_flag) {
            printf("Ratmark enabled\n");
        }
        if(unlock_flag) {
            printf("Framerate unlock enabled\n");
        }
        printf("Loop count: %d\n", loop_count);
    }
}

#ifdef AUDIO_EN
void port_audio() 
{
    #ifdef __MINGW32__
    PlaySound("loop", NULL, SND_RESOURCE | SND_LOOP | SND_ASYNC);
    #endif

    #ifdef __linux__
    pthread_t audio_thread;
    pthread_create(&audio_thread, NULL, linux_audioplay, NULL);
    pthread_join(audio_thread, NULL);
    #endif
}
#endif

void port_sleep(int ms)
{
    #if defined(__linux__) || defined(__MINGW32__)
        usleep(ms * 1000);
    #endif

    #ifdef __WATCOMC__
        delay(ms);
    #endif
}

void port_cls()
{
    printf("\033[H\033[J");
}

void port_gotoxy(int x, int y)
{
    printf("\033[%d;%dH", (y), (x));
}

int main(int argc, char **argv)
{
    clock_t start = clock();
    static struct option long_options[] = {
        {"rainbow", no_argument, 0, 'r'},
        {"ratmark", no_argument, 0, 'm'},
        {"unlock", no_argument, 0, 'u'},
        {"debug", no_argument, 0, 'd'},
        {"help", no_argument, 0, 'h'},
        {0, 0, 0, 0}
    };

    while ((opt = getopt_long(argc, argv, "rmuhd", long_options, NULL)) != -1) {
            switch (opt) {
            case 'h':
                print_help();
                return 0;
            case 'r':
                rainbow_flag = 1;
                FILE *pipe = popen("lolcat", "w");
                if (pipe == NULL) {
                    perror("popen");
                    printf("Erorr - lolcat implementation not found\n");
                    exit(EXIT_FAILURE);
                }
                dup2(fileno(pipe), STDOUT_FILENO);
                break;
            case 'm':
                ratmark_flag = 1;
                unlock_flag = 1;
                break;
            case 'u':
                unlock_flag = 1;
                break;
            case 'd':
                debug_flag = 1;
                break;
            case '?':
                fprintf(stderr, "Unknown option: %c\n", opt);
                return 1;
            default:
                abort();
        }
    }

    port_cls();
    port_gotoxy(0, 0);
    
    #ifdef AUDIO_EN
    port_audio();
    #endif

    for(int i = 0; i == i; i++) {
        print_debug();

        printf("\n                                                         You have been blessed with %d spins of the rat.\n", loop_count);
        
        fputs(frames[i], stdout);

        if (!unlock_flag) {
            port_sleep(delay_time);
        }

        if(i == frame_count-2) {
            if(loop_count == 100 && ratmark_flag) {
                clock_t end = clock();
                int time_taken = (int)((double)(end - start) / CLOCKS_PER_SEC * 1000);
                printf("100 ratmarks in %dms\n", time_taken);
                return 0;
            }

            loop_count++;
            i = 0;
        }

        port_gotoxy(0, 0);
    }    
	return 0;
}