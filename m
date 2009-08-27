From: Saikiran Madugula <hummerbliss@gmail.com>
Subject: Re: can't use MARK target
Date: Thu, 27 Aug 2009 17:06:04 +0100
Message-ID: <4A96AEEC.5040902@gmail.com>
References: <1f4ef0970908270744x941cc84i3e85cb2600325d3a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=a3HBXCfq5AcR0v6dK3SEdng+LXhGCIUjUUP0OoalAMk=;
        b=CQlvxxNQ6yQG5x74Ygxgd63HTIRWkQAvEb7vVFsFFvuf+N/1GR7cAS+8N4acmHF2z5
         /BLO7uNhVH0mgVmbxZIgPKWpsKX12UaMFrOrKDkP74xh5z9BbrAUU2eerk4hCKUPqWgo
         T952j71LElL7DOtHA8Dgkc8WV0KXO2+3tpGzU=
In-Reply-To: <1f4ef0970908270744x941cc84i3e85cb2600325d3a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Brown <sbrown25@gmail.com>
Cc: netfilter@vger.kernel.org

Steve Brown wrote:
> I'm trying to use iptables to mark some packets for later use.  The
> command should be pretty simple:
> 
> iptables -t mangle -A PREROUTING -p tcp --dport 22 -j MARK --set-mark 1
> 
> When I try to issue the command, I get:
> 
> iptables v1.4.4: Couldn't load match
> `MARK':/usr/local/libexec/xtables/libipt_MARK.so: cannot open shared
> object file: No such file or directory
> 
> Try `iptables -h' or 'iptables --help' for more information.
> 
> The MARK and connmark kernel modules are loaded, and I've rebuilt
> iptables from source a couple of times, but I cannot figure out why it
> won't build the MARK support module?  Any gotchas I should be aware
> of?
> --
My wild guess something to do with dynamic linking, does adding
/usr/local/libexec/ path to /etc/ld.so.conf help ?
