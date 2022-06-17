From: Amish <anon.amish@gmail.com>
Subject: iptables 1.8.8 fails with error code 111 but iptables 1.8.7 succeeds
 with same script
Date: Fri, 17 Jun 2022 20:02:13 +0530
Message-ID: <f8b1ba7f-2d59-e068-92ca-a139959aa2fd@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:from
         :subject:to:content-transfer-encoding;
        bh=A9FoS/8n4TCVtap/oBZ8mSPExs/8hEEW6eOt7wS7EU4=;
        b=hHBid/mcV+J2UuIYcviu9MSkJyXoj8v2ZKLQxAmSlaex9QyKvZTKG1PJKicAmF0W8/
         X48kJ0HRJ7EcDV79GkkEZ4LC1wjsQcIeTm0tJb+RzTEhyYnQrUuhvvOa6Q41vekZatx8
         q5KhGtxOikeDFxm/WIOjBrgwAZ4l/5FZGPPBEE3sU7TzmSUQ0nSPyEQc7LOxm6yWd+qj
         yuMBkVxh4Qzf8KYbtT4P+GFNIZUFVxgJsBAhL9hZfQC4YTF9jjgVN63/EiBGhj5UwXCI
         35K3m7o0pO2qvDkrdi6YFjYrzcacOE9xdDnL0hRWZEBvJN09RtIpG+lBZD/JXbUd3ZgH
         beXQ==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

Hello,

I use Arch Linux. Apache 2.4.54 and iptables 1.8.8 (nft based).

I have a setuid script, given below, which runs via apache httpd and 
simply calls "iptables -w -nvL INPUT" and gives the output.

But with iptables 1.8.8 it fails with error code 111 (undocumented code)

 > curl http://127.0.0.1/ipt.e
EUID = 0, EGID=33
iptables exited with exit code=111
iptables exited with exit code=111


It doesn't even print any error message. (not even to httpd error log - 
via stderr)

But if I downgrade to iptables 1.8.7, it works as expected.

 > curl http://127.0.0.1/ipt.e
EUID = 0, EGID=33
iptables v1.8.7 (nf_tables)
iptables exited with exit code=0
Chain INPUT (policy DROP 290 packets, 27644 bytes)
  pkts bytes target     prot opt in     out source               
destination
<output cut>
iptables exited with exit code=0


So it appears to be some kind of bug introduced in 1.8.8.

Can someone guide / check?

The C script follows: (Can be used for testing)

 > cat ipt.c
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/wait.h>

extern char **environ;

pid_t my_wait(int *status, pid_t pid, int options)
{
     pid_t got_pid;
     while ((got_pid = waitpid(pid, status, options)) == (pid_t)-1) {
         if (errno != EINTR) return -1;
         errno = 0;
     }
     return got_pid;
}

int my_system(const char *program, char *const argv[])
{
     pid_t pid = fork();
     if (pid==(pid_t)-1) return -1;
     if (!pid) { execve(program, argv, environ); exit(127); }

     int status = -1;
     return ((my_wait(&status, pid, 0) == (pid_t)-1) ? -1 : status);
}

int main(int argc, char **main_argv)
{
     printf ("Content-type: text/plain\n\n");
     printf ("EUID = %d, EGID=%d\n", geteuid(), getegid());
     fflush (stdout);

     int i = 0;
     static char *argv[10];
     argv[i++] = (char *) "iptables";
     argv[i++] = (char *) "-w";
     argv[i++] = (char *) "--version";
     argv[i++] = NULL;
     int wstatus = my_system ("/usr/bin/iptables", argv);
     fflush (stdout);
     if (WIFEXITED(wstatus)) printf("iptables exited with exit 
code=%d\n", WEXITSTATUS(wstatus));
     else printf("something went wrong in calling iptables\n");
     fflush (stdout);

     i = 2;
     argv[i++] = (char *) "-nvL";
     argv[i++] = (char *) "INPUT";
     argv[i++] = NULL;
     wstatus = my_system ("/usr/bin/iptables", argv);
     fflush (stdout);
     if (WIFEXITED(wstatus)) printf("iptables exited with exit 
code=%d\n", WEXITSTATUS(wstatus));
     else printf("something went wrong in calling iptables\n");
     fflush (stdout);

     return 0;
}

# compiling and setting setuid bit
 > cc ipt.c
 > mv a.out /srv/http/ipt.e
 > chown root:http /srv/http/ipt.e
 > chmod 750 /srv/http/ipt.e
 > chmod u+s /srv/http/ipt.e

