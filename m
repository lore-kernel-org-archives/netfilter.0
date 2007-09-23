From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 00:30:58 -0400
Message-ID: <20070923043058.GA2940@minastirith>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F5CF0C.3060004@verizon.net>
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sep 22, 2007, Gerry Reno wrote:

> Gerry Reno wrote:
> >Well, I'm just forging ahead.  Hopefully someone can answer my 
> >original question about user chains.
> >
> >Right now I tried starting the fwknop daemon and was greeted with 
> >these errors:
> >
> ># service fwknop start
> >Starting the fwknop daemons: Can't load 
> >'/usr/lib/fwknop/i386-linux-thread-multi/auto/Net/Pcap/Pcap.so' for 
> >module Net::Pcap: libpcap.so.0.9.4: cannot open shared object file: No 
> >such file or directory at 
> >/usr/lib/perl5/5.8.8/i386-linux-thread-multi/DynaLoader.pm line 230.
> >at /usr/sbin/fwknopd line 47
> >Compilation failed in require at /usr/sbin/fwknopd line 47.
> >BEGIN failed--compilation aborted at /usr/sbin/fwknopd line 47.
> >
> >
> >What I have installed is the latest rpm from CipherDyne:  
> >fwknop-1.8.2-1.i386.rpm 
> ><http://www.cipherdyne.org/fwknop/download/fwknop-1.8.2-1.i386.rpm> 
> >and I guess this rpm either doesn't have the right dependencies and 
> >did not perform something necessary during %post.
> >
> >help...

The fwknop RPM is built with all required perl modules and installs them
in /usr/lib/fwknop so as to not pollute the system perl library tree,
but this can cause dependency issues with C libraries occasionally like
the one you are seeing.  Here is an automated solution for this; just
download the cd_rpmbuilder script and execute it like so (this will
build the RPM on your system):

http://www.cipherdyne.org/scripts/cd_rpmbuilder.tar.gz

# ./cd_rpmbuilder -p fwknop
[+] Getting latest version file:
      http://www.cipherdyne.org/fwknop/fwknop-latest
[+] Downloading file:
      http://www.cipherdyne.org/fwknop/download/fwknop-1.8.2.spec
[+] Downloading file:
      http://www.cipherdyne.org/fwknop/download/fwknop-1.8.2.spec.md5
[+] Valid md5 sum check for fwknop-1.8.2.spec
[+] Downloading file:
      http://www.cipherdyne.org/fwknop/download/fwknop-1.8.2.tar.gz
[+] Downloading file:
      http://www.cipherdyne.org/fwknop/download/fwknop-1.8.2.tar.gz.md5
[+] Valid md5 sum check for fwknop-1.8.2.tar.gz
[+] Building RPM, this may take a little while (try -v if you want
    to see all of the steps)...

[+] The following RPMS were successfully built:

      /usr/src/redhat/SRPMS/fwknop-1.8.2-1.src.rpm (source RPM)
      /usr/src/redhat/RPMS/i386/fwknop-1.8.2-1.i386.rpm

> >Gerry
> Well, I found out that the problem is that Fedora 7 has libpcap 0.9.5 
> installed and fwknop is looking specifically for libpcap 0.9.4.  So I 
> just created a symlink from 0.9.5 to 0.9.4 in /usr/lib.  We'll see if 
> this will work.
> 
> ----------------------------------
> So then we get to the next error:
> 
> # service fwknop start
> Starting the fwknop daemons: [*] /etc/fwknop/access.conf: source ANY 
> missing PORT_OFFSET, defaulting to 61000. at /usr/sbin/fwknopd line 2911.
>                                                           [FAILED]

Are you using the deprecated port knocking mode?  I would recommend
against this; single packet authorization offers better security
properties.

If you want to use a symmetric cipher (Rijndael) for SPA messages, your
/etc/fwknop/access.conf file should look something like this:

SOURCE: ANY;
OPEN_PORTS: tcp/22;  ### testing
FW_ACCESS_TIMEOUT: 30;
REQUIRE_USERNAME: mbr;
KEY: _yourkey_;
ENABLE_CMD_EXEC: Y;

Also, set AUTH_MODE to PCAP in /etc/fwknop/fwknop.conf.  If you want to
use GnuPG keys instead, these instructions should help:

http://www.cipherdyne.org/fwknop/docs/gpghowto.html

> Ok, so it defaulted to 61000 but then why not start at this point?
> 
> ----------------------------------
> next try:
> 
> put in a PORT_OFFSET
> 
> # service fwknop start
> Starting the fwknop daemons: [*] /etc/fwknop/access.conf: source ANY 
> missing KNOCK_INTERVAL, defaulting to 60. at /usr/sbin/fwknopd line 2973.
>                                                           [FAILED]
> 
> ----------------------------------
> next try:
> 
> 
> put in a KNOCK_INTERVAL
> 
> # service fwknop start
> Starting the fwknop daemons:                               [  OK  ]
> 
> Finally!

PORT_OFFSET and KNOCK_INTERVAL are legacy variables only used in port
knocking mode; see above.

> But, when I check the log I see this:
> 
> Sep 22 21:57:48 grp-01-00-50 fwknopd: starting fwknopd
> Sep 22 21:57:50 grp-01-00-50 fwknopd: flushing existing iptables 
> IPT_AUTO_CHAIN chains
> Sep 22 21:57:50 grp-01-00-50 fwknopd: warning, could not find iptables 
> state tracking rules in INPUT chain   <------- here I think it is 
> confused about RH/Fedora iptables structure

That warning message can be ignored if there are any state tracking
rules to allow established TCP connections to remain open.  The state
tracking rule check is very basic (I just introduced it in fwknop-1.8.2
and it doesn't check user-defined chains yet, but I will add this for
1.8.3).

> Sep 22 21:57:50 grp-01-00-50 fwknopd: imported access directives (1 
> SOURCE definitions).
> Sep 22 21:57:50 grp-01-00-50 kernel: device eth0 entered promiscuous mode
> Sep 22 21:57:52 grp-01-00-50 setroubleshoot:      SELinux is preventing 
> /sbin/iptables (iptables_t) "write" to /var/log/fwknop/fwknopd.iptout 
> (var_log_t).      For complete SELinux messages. run sealert -l 
> 13ca6c50-c04a-4602-9464-9a01ec6a0ba5

If you create an SELinux policy that works with fwknop please let me
know.  Basically, in SPA mode, fwknopd needs to do the following:

- Parse files out of /etc/fwknop.
- Sniff on a network interface (it doesn't have to sniff promiscuously
  if you always send SPA packets to an interface with an IP assigned;
  see the ENABLE_PCAP_PROMISC var in the fwknop.conf file).
- Execute various iptables commands.
- Communicate over a domain socket with the knoptm daemon.
- Execute gpg if GnuPG keys are used.
- Write syslog messages and send emails.

Thanks,

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F


> I tried to restorecon -v the file but no luck, still same error.
> 
> # ls -l /var/log/fwknop/
> total 16
> dr-x------ 2 root root 4096 2007-09-22 21:57 errs
> -rw-r--r-- 1 root root    0 2007-09-22 22:22 fwknopd.ipterr
> -rw-r--r-- 1 root root    0 2007-09-22 22:22 fwknopd.iptout
> 
> ????
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
