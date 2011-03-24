From: =?ISO-8859-1?Q?Salih_G=F6n=FCll=FC?= <sag@open.ch>
Subject: ulogd segfault on kill TERM
Date: Thu, 24 Mar 2011 17:19:44 +0100
Message-ID: <4D8B6F20.4010205@open.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

ulogd is segfaulting on kill TERM when logfile is set to 'syslog' in the 
configuration. Please find a patch below. Another point: Should stdout 
stay open on daemonize when logging to syslog ??



--- ulogd.c.orig        2011-03-24 15:45:34.000000000 +0100
+++ ulogd.c     2011-03-24 15:48:37.000000000 +0100
@@ -1047,7 +1047,7 @@
         unload_plugins();
  #endif

-       if (logfile != NULL  && logfile != stdout) {
+       if (logfile != NULL  && logfile != stdout && logfile != 
&syslog_dummy ) {
                 fclose(logfile);
                 logfile = NULL;
         }
@@ -1228,7 +1228,7 @@
                 if (fork()) {
                         exit(0);
                 }
-               if (logfile != stdout && logfile != &syslog_dummy)
+               if (logfile != stdout )
                         fclose(stdout);
                 fclose(stderr);
                 fclose(stdin);



Cheers,

    -salih
