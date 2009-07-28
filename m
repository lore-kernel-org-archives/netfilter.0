From: Billy Crook <billycrook@gmail.com>
Subject: Re: Firewall Configuration Help
Date: Tue, 28 Jul 2009 08:19:19 -0500
Message-ID: <a43edf1b0907280619y24f759eble72105e67a70e5ac@mail.gmail.com>
References: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com> 
	<47ae5fdc6d1c4a93d1035f61774996ec@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=bVpjlnJAqsE0y+kgaAenfHPPu1FHC6IJffuHQPOdAcw=;
        b=rOvk5c96HgBjRGDEy/xHelPT3ozX39lXIy+axIKv+iGLD7C7OgJVhdljYzc7jWm5ls
         W1VshL5e9Q/o8c3MRR7CjD87jrcBDvcXw4Qv1g1Gp/r+ZjgGNqKFwVxaPy6vgGRwZpmD
         GmgpdBP2m2PHhFjDc51tkc/vvqBUIhLXLtc24=
In-Reply-To: <47ae5fdc6d1c4a93d1035f61774996ec@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julien Vehent <julien@linuxwall.info>
Cc: NICHOLAS KLINE <nkline@kent.edu>, netfilter@vger.kernel.org

On Tue, Jul 28, 2009 at 04:09, Julien Vehent<julien@linuxwall.info> wrote:
> Hello Nicholas,
>
>
> On Mon, 27 Jul 2009 13:56:59 -0400, NICHOLAS KLINE <nkline@kent.edu> wrote:
>> $IPTABLES -A INPUT -s 255.0.0.0/8 -j LOG --log-prefix "Spoofed source IP"
>> $IPTABLES -A INPUT -s 255.0.0.0/8 -j DROP
>> $IPTABLES -A INPUT -s 0.0.0.0/8 -j LOG --log-prefix "Spoofed source IP"
>> $IPTABLES -A INPUT -s 0.0.0.0/8 -j DROP
>>
>
> Errrr.... why would you want to drop all the packets coming from the
> private network you are connected to ?
> These are very dangerous rules. If you are not connected directly, with a
> public address, to the internet, you will more likely be connected through
> a local network, and then your rules are going to block everything.

That's not exactly what these rules would do.  It will block broadcast
traffic like netbios, avahi, and printer advertisements though.  That
said, Nick is clearly giong to be in a world of hurt when he enables a
ruleset as nasty as this.  Simple is better.  Nick's reminds me of
SUSE!  Unless you intend to read about every dropped packet, why are
you logging them?  And stop talking about classed networks.  That era
has been dead for a very long time.

Use iptables-save and iptables-restore for firewall configs.  It's
what they exist for.

And here's my config, which is longer than I'd like, but as short as
it can be and still do the job.  You might change :FORWARD ACCEPT to
:FORWARD REJECT if you don't ever plan to act as a router.

[root@Zero ~]# cat /etc/sysconfig/iptables
# Firewall configuration written by system-config-firewall
# Manual customization of this file is not recommended.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
#Allow incoming Sunrpc from lan (to facilitate NFS)
-A INPUT -m state --state NEW -m tcp -p tcp --dport 111 -s
192.168.171.0/24 -j ACCEPT
#Allow incoming syslog from lan
-A INPUT -m state --state NEW -m udp -p udp --dport 514 -s
192.168.171.0/24 -j ACCEPT
#Allow incoming rpc.mountd from lan
-A INPUT -m state --state NEW -m udp -p udp --dport 892 -s
192.168.171.0/24 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 892 -s
192.168.171.0/24 -j ACCEPT
#Allow incoming NFS from lan
-A INPUT -m state --state NEW -m udp -p udp --dport 2049 -s
192.168.171.0/24 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 2049 -s
192.168.171.0/24 -j ACCEPT
#Allow incoming LDAP from lan
-A INPUT -m state --state NEW -m tcp -p tcp --dport 389 -s
192.168.171.0/24 -j ACCEPT
#Allow incoming gmonds from lan
-A INPUT -m state --state NEW -m udp -p udp --dport 8649 -s
192.168.171.0/24 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 8649 -s
192.168.171.0/24 -j ACCEPT
#Allow incoming SSH
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
#Allow incoming HTTP
-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
#Allow incoming SMTP from the world
-A INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j ACCEPT
#Allow incoming VMware
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 902  -j ACCEPT
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 904  -j ACCEPT
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 8222 -j ACCEPT
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 8333 -j ACCEPT
#Allow Jabber clients and federation
-A INPUT -m state --state NEW -m tcp -p tcp --dport 5222 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 5269 -j ACCEPT
#Allow incoming KTorrent
-A INPUT -m state --state NEW -m tcp -p tcp --dport 6881 -j ACCEPT
#Allow incoming TFTP
-A INPUT -p udp --dport 69 -j ACCEPT
#Allow incoming DNS
-A INPUT -m state --state NEW -m udp -p udp --dport 53 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 53 -j ACCEPT
#Allow network printer awareness
-A INPUT -p udp -m udp --dport 631 -j ACCEPT
#Default policy ot rejection
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT
