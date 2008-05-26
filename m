From: Filippo Zeus <filippozeus@gmail.com>
Subject: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Mon, 26 May 2008 20:51:13 +0200
Message-ID: <483B06A1.6030907@gmail.com>
References: <483B04A8.9000405@gmail.com>
Reply-To: filippozeus@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:disposition-notification-to:date:from:reply-to:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
        bh=YBZZz5QppaurKPcPE1PF+uwarVOR4UkGS1o79kMKBEU=;
        b=Gb0iPo2hxCjA9MboIVoMNOoFhbchEebToTEA2Gi0KEw0ZIMP5CcM0AZueynR4usuk5RZ4Ig36d3FflNgMFBuIsZrFuXlP2XMQZ/Kx/reHKmhWrP8NlXcbcDAXMjLCT43EpDq3gay19uMw5l7PeWXNP5UYS6+fxWkdv9Y34qMbBA=
In-Reply-To: <483B04A8.9000405@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
i think the ftp_contrack module has a bug.

I'm setting up proftpd 1.3.1 with TLS for encrypting auth+data only 
traffic to let ftp_conntrack module understand the port command when a 
client connects to the server using a PASV mode.

Look at link below and search for question
Using mod_tls, FTP sessions through my firewall now no longer work. 
What's going on?

ftp_conntrack module probably do no understand the port command so it do 
not open the port.
Tryed to define a limited passive ports in proftpd.conf and setted up 
iptables to ACCEPT any conection in this range fixed the problem. But 
pratically i've bypassed the ftp_conntrack module.

Here are system infos and main configuration parts.

Debian Lenny
uname -a
Linux debian 2.6.24-1-amd64 #1 SMP Thu Mar 27 16:52:38 UTC 2008 x86_64 
GNU/Linux
__________
iptables -V
iptables v1.4.0
________
proftpd -V
Compile-time Settings:
 Version: 1.3.1
 Platform: LINUX
 Built With:
   configure --prefix=/usr 
--with-includes=/usr/include/postgresql:/usr/include/mysql 
--mandir=/usr/share/man --sysconfdir=/etc/proftpd 
--localstatedir=/var/run --libexecdir=/usr/lib/proftpd --enable-sendfile 
--enable-facl --enable-dso --enable-autoshadow --enable-ctrls 
--with-modules=mod_readme --enable-ipv6 --build x86_64-linux-gnu 
--with-shared=mod_site_misc:mod_load:mod_ban:mod_quotatab:mod_sql:mod_sql_mysql:mod_sql_postgres:mod_quotatab_sql:mod_ldap:mod_quotatab_ldap:mod_ratio:mod_tls:mod_rewrite:mod_radius:mod_wrap:mod_wrap2:mod_wrap2_file:mod_wrap2_sql:mod_quotatab_file:mod_quotatab_radius:mod_facl:mod_ctrls_admin:mod_ifsession 


 CFLAGS: -O2 -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_OPENSSL 
-DUSE_LDAP_TLS  -Wall -Wno-long-double
 LDFLAGS: -L$(top_srcdir)/lib
 LIBS: -lsupp -lcrypt

 Files:
   Configuration File:
     /etc/proftpd/proftpd.conf
   Pid File:
     /var/run/proftpd.pid
   Scoreboard File:
     /var/run/proftpd/proftpd.scoreboard
   Shared Module Directory:
     /usr/lib/proftpd

 Features:
   + Autoshadow support
   + Controls support
   + curses support
   - Developer support
   + DSO support
   + IPv6 support
   + Largefile support
   - Lastlog support
   + ncurses support
   - NLS support
   + OpenSSL support
   + POSIX ACL support
   + Shadow file support
   + Sendfile support
   + Trace support

 Tunable Options:
   PR_TUNABLE_BUFFER_SIZE = 1024
   PR_TUNABLE_GLOBBING_MAX = 8
   PR_TUNABLE_HASH_TABLE_SIZE = 40
   PR_TUNABLE_NEW_POOL_SIZE = 512
   PR_TUNABLE_RCVBUFSZ = 8192
   PR_TUNABLE_SCOREBOARD_BUFFER_SIZE = 80
   PR_TUNABLE_SCOREBOARD_SCRUB_TIMER = 30
   PR_TUNABLE_SELECT_TIMEOUT = 30
   PR_TUNABLE_SNDBUFSZ = 8192
   PR_TUNABLE_TIMEOUTIDENT = 10
   PR_TUNABLE_TIMEOUTIDLE = 600
   PR_TUNABLE_TIMEOUTLINGER = 180
   PR_TUNABLE_TIMEOUTLOGIN = 300
   PR_TUNABLE_TIMEOUTNOXFER = 300
   PR_TUNABLE_TIMEOUTSTALLED = 3600
   PR_TUNABLE_XFER_BUFFER_SIZE = 1024
   PR_TUNABLE_XFER_SCOREBOARD_UPDATES = 10
___________
*** CONFIGURATIONS ****
cat /etc/proftpd/proftpd.conf
# Includes DSO modules
Include /etc/proftpd/modules.conf

UseIPv6                 off
ServerName              "ftp.foo.barl"
ServerType              standalone
ServerAdmin             support@foo.bar
UseReverseDNS           off
DeferWelcome            off
MultilineRFC2228        on
DefaultServer           off
DefaultAddress          127.0.0.1
TimeoutNoTransfer       600
TimeoutStalled          600
TimeoutIdle             1200
DisplayLogin            "README"
#DisplayFirstChdir      .message
ListOptions             "-l"
DenyFilter              \*.*/
Port                    21
MaxInstances            50
User                    proftpd
Group                   nogroup
Umask                   000
AllowOverwrite          on
UseSendFile             off
TransferLog             /var/log/proftpd/main.log
SystemLog               /var/log/proftpd/system.log
LogFormat       default         "%t USER: SEND %r "
LogFormat       extended        "%t USER: %u (from IP %a ) send CMD: %r 
REPLY: %s (Transfer %b bytes in %T sec.)"
SocketBindTight         off

<IfModule mod_tls.c>
       TLSEngine on
       TLSLog /var/log/proftpd/tls.log
       TLSProtocol SSLv23
       TLSOptions NoCertRequest
       TLSRSACertificateFile /etc/proftpd/ssl/proftpd.cert.pem
       TLSRSACertificateKeyFile /etc/proftpd/ssl/proftpd.key.pem
       TLSVerifyClient off
</IfModule>

<IfModule mod_quota.c>
       QuotaEngine on
</IfModule>

<IfModule mod_ratio.c>
       Ratios on
</IfModule>

<IfModule mod_delay.c>
       DelayEngine on
</IfModule>

<IfModule mod_ctrls.c>
       ControlsEngine on
       ControlsMaxClients 2
       ControlsLog /var/log/proftpd/controls.log
       ControlsInterval 5
       ControlsSocket /var/run/proftpd/proftpd.sock
</IfModule>

<IfModule mod_ctrls_admin.c>
       AdminControlsEngine on
</IfModule>


<Global>
       PassivePorts                    32768 32778
       MaxLoginAttempts                2
       ServerIdent                     on              " "
       ExtendedLog                     /var/log/proftpd/Activity.log   
AUTH            default
       ExtendedLog                     /var/log/proftpd/Activity.log   
WRITE,READ      extended
       DefaultRoot                     ~
       AllowRetrieveRestart            on
       MaxClients                      30      "SERVER_BUSY: Please 
retry. NOTE: The Accident will be reported to System Administrator"
       MaxClientsPerHost               5       "ERROR: You can't open 
more than five (5) session form the same host. Close an FTP session or 
retry later."
       AllowStoreRestart               on
       DeleteAbortedStores             off
       LoginPasswordPrompt             off
       AccessDenyMsg                   "ERROR: Incorrect Login! Please 
Retry. NOTE: The Accident will be reported to System Admnistrator"
       AccessGrantMsg                  "Welcome to lifesaver FTP 
service, DO NOT FORGET TO SWITCH to TLS/SSL FTP ! ... and please keep in 
mind all your actions here will be logged! "
       DefaultTransferMode             binary
       IdentLookups                    off
       HiddenStores                    off
       ShowSymlinks                    off
       DirFakeGroup                    on      ftp
       DirFakeUser                     on      ftp
       AllowOverwrite                  on
       WtmpLog                         on
       RootLogin                       off
       AuthAliasOnly                   off
       PathDenyFilter                  "\\.(ftpaccess|htaccess)$"
       ListOptions                     "-l"
       DisplayConnect                  "Welcome to xxxxxx. Please Login 
... "
       DisplayGoAway                   "Welcome to xxxxxx ... Sorry, too 
many user are logged in ... Please retry later"
       AuthOrder                       mod_auth_file.c
       RequireValidShell               no
       AuthUserFile                    /etc/proftpd/passwd

       <Limit SITE_CHMOD>
               DenyAll
       </Limit>

       <IfModule mod_delay.c>
               DelayEngine     on
       </IfModule>

</Global>

<VirtualHost xx.xxx.x.x>
       ServerName "ftp.lifesaver.it"
       ServerIdent                     on              "FTP Server 
ready. Please use FTP-TLS or login will be rejected. "
       TransferLog /var/log/proftpd/ftp-lifesaver-it.log
               <Limit LOGIN>
                       AllowUser ftp_temp
                       Deny All
               </Limit>
               <IfModule mod_tls.c>
                       TLSEngine on
                       TLSLog /var/log/proftpd/tls.log
                       TLSOptions NoCertRequest
                       TLSRSACertificateFile 
/etc/proftpd/ssl/proftpd.cert.pem
                       TLSRSACertificateKeyFile 
/etc/proftpd/ssl/proftpd.key.pem
                       TLSVerifyClient off
                       TLSRequired auth+data
               </IfModule>

       TransferRate RETR 213.0:1024
       TransferRate APPE 213.0:1024
       TransferRate STOR 2048.0:1024
       TransferRate STOU 2048.0:1024
</VirtualHost>
____________
cat /etc/init.d/firewall

# Loading ipfilter connection tracking modules
       echo -n "Loading conntrack modules ... "
       modprobe ip_conntrack
       modprobe ip_conntrack_ftp
       modprobe ip_conntrack_irc
       modprobe ip_nat_ftp

# Loading ipfilter rules
       echo -n "Loading ipfilter rules ... "

       # Setting Chains State
               iptables -P INPUT DROP
               iptables -P OUTPUT ACCEPT
               iptables -P FORWARD ACCEPT

       # Drop Ping-Flood
               iptables -A INPUT -p icmp --icmp-type echo-request -m 
limit --limit 1/s --limit-burst 5 -j ACCEPT
               iptables -A INPUT -p icmp --icmp-type echo-request -m 
limit --limit 1/s --limit-burst 5 -j LOG --log-prefix PING_FLOOD-DROP
               iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

       # Allow loopback traffic (lo)
               iptables -A INPUT -i lo -j ACCEPT
               iptables -A OUTPUT -o lo -j ACCEPT

       # Allow established connections
               iptables -A OUTPUT -o $NIC0 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
               iptables -A OUTPUT -o $NIC1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
               iptables -A OUTPUT -o $NIC2 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
               iptables -A INPUT -i $NIC0 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
               iptables -A INPUT -i $NIC1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
               iptables -A INPUT -i $NIC2 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
               iptables -A FORWARD -i $NIC0 -m state --state 
ESTABLISHED,RELATED -j ACCEPT

       # Allow new outgoing tcp, udp, icmp connections
               iptables -A OUTPUT -p tcp -o $NIC0 -m state --state NEW 
-j ACCEPT
               iptables -A OUTPUT -p tcp -o $NIC1 -m state --state NEW 
-j ACCEPT
               iptables -A OUTPUT -p tcp -o $NIC2 -m state --state NEW 
-j ACCEPT
               iptables -A OUTPUT -p udp -o $NIC0 -m state --state NEW 
-j ACCEPT
               iptables -A OUTPUT -p udp -o $NIC1 -m state --state NEW 
-j ACCEPT
               iptables -A OUTPUT -p udp -o $NIC2 -m state --state NEW 
-j ACCEPT
               iptables -A OUTPUT -p icmp -o $NIC0 -m state --state NEW 
-j ACCEPT
               iptables -A OUTPUT -p icmp -o $NIC1 -m state --state NEW 
-j ACCEPT
               iptables -A OUTPUT -p icmp -o $NIC2 -m state --state NEW 
-j ACCEPT

       # Drop fragments and invalid packets
               iptables -A INPUT -f -m limit --limit 1/s --limit-burst 1 
-j LOG --log-prefix INPUT_FRAG-DROP:
               iptables -A INPUT -f -j DROP
               iptables -A INPUT -m state --state INVALID -m limit 
--limit 1/s --limit-burst 1 -j LOG --log-prefix INPUT_INVALID-DROP:
               iptables -A INPUT -m state --state INVALID -j DROP
               iptables -A OUTPUT -f -m limit --limit 1/s --limit-burst 
1 -j LOG --log-prefix OUTPUT_FRAG-DROP:
               iptables -A OUTPUT -f -j DROP
               iptables -A OUTPUT -m state --state INVALID -j LOG 
--log-prefix OUTPUT_INVALID-DROP:
               iptables -A OUTPUT -m state --state INVALID -j DROP

       # Allow FTP from LAN
               iptables -A INPUT -p tcp --syn -i $NIC0 -s $LANPOOL -d 
$LAN --dport 21 -m state --state NEW -j ACCEPT
       # Allow FTP from WAN2
               iptables -A INPUT -p tcp --syn -i $NIC2 -d $WAN2 --dport 
21 -m state --state NEW -j ACCEPT
##
# FTPES Workaround
##
iptables -A INPUT -p tcp --syn -i $NIC2 -d $WAN2 --dport 32768:32778 -j 
ACCEPT

       # Allow SSH from LAN
...
----- CUTTED HERE -----

