From: "Michael J. Tubby B.Sc. \(Hons\) G8TIC" <mike.tubby@thorcom.co.uk>
Subject: Re: firewall script placement
Date: Sun, 19 Jan 2003 19:30:49 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c2bff1$45db51e0$0a90a8c0@boris>
References: <00d601c2bfbb$4d85a930$0401a8c0@darthvader>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Zander Subatomic <zander@subatomic.org.uk>, netfilter@lists.netfilter.org


> ok this may sound like a silly question but where do I put the script?? I'm
> running 7.3 RedHat and before I used to just write the script in a file and
> then copy & paste it into a command line for the initial creation and then
> use the iptables-save to /etc/sysconfig/iptables which worked fine for it to
> be loaded on a reboot. Now I have a larger, more complex rule set I thought
> I'd finall write a script for it but I've only got a slight understanding of
> the start up process.
> 
> Do I need to put the script in the /etc/rc.d/init.d/ directory and then
> create the startup/kill links in the /etc/rcX.d/ directories by hand or can
> I just put a:
> 
> # chkconfig: 2345 <one above iptables start number> <one below iptables kill
> number>
> 
> Could I change the line: IPTABLES_CONFIG=/etc/sysconfig/iptables in
> /etc/rc.d/init.d/iptables script to my script? I'm assuming though it would
> have to be in the format of the iptables-save command so wouldn't work? I
> have looked around the place and previous posts but have never seen this
> mentioned.
> 
> Or am I way of the mark? :o)
> 
> cheers
> 
> Zander
> 


Zander,

I use a homebrew iptables based firewall script on all my RH 7.2, 7.3
and 8.0 machines which is based on Oskar's tutorial and good work
as its much more flexible than the built-in systems...

I call the script "rc.firewall" and keep it in /etc/rc.d as its a bit non-standard
like rc.local and then cd to /etc/rc.d/rc3.d and hack things a little by
removing S07/08/09 ipchains/iptables stuff, and adding a symbolic
link:

    ln -s ../rc.firewall S11firewall

so that the start up sequence ends up looking something like this:

    S05kudzu -> ../init.d/kudzu
    S06reconfig -> ../init.d/reconfig
    S10network -> ../init.d/network
    S11firewall -> ../rc.firewall
    S12syslog -> ../init.d/syslog
    S18autofs -> ../init.d/autofs
    S20apcupsd -> ../init.d/apcupsd
    S20random -> ../init.d/random
    S25netfs -> ../init.d/netfs
    S35identd -> ../init.d/identd
    S40atd -> ../init.d/atd
    S50xinetd -> ../init.d/xinetd
    S55named -> ../init.d/named
    S55sshd -> ../init.d/sshd
    S56ntpd -> ../init.d/ntpd
    S56rawdevices -> ../init.d/rawdevices
    S65dhcpd -> ../init.d/dhcpd
    S75keytable -> ../init.d/keytable
    S80courier-imap -> ../init.d/courier-imap
    S80exim -> ../init.d/exim
    S80spamassassin -> ../init.d/spamassassin
    S85httpd -> ../init.d/httpd
    S90crond -> ../init.d/crond
    S90squid -> ../init.d/squid
    S95anacron -> ../init.d/anacron
    S99local -> ../rc.local


Something like this should work for you also....


Mike


