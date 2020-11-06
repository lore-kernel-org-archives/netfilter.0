From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Fri, 6 Nov 2020 10:13:49 -0500
Message-ID: <CANf9dFNjO+912xTqgheHRB2wqbstMXNv2+VFV6L+QxyyTLVUgA@mail.gmail.com>
References: <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net> <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc> <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
 <20201105170754.GB25824@breakpoint.cc> <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
 <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com>
 <20201105210146.GA10732@salvia> <CANf9dFPDXiO3kYa-=UzknyjCcu4Y5tEkZZnQP9GhD9VG=OcFBw@mail.gmail.com>
 <20201106105833.GA13845@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p8EJRcld0bjXPaiWBj27sK1lfHIdcjhdgqsqyDw3rWM=;
        b=TAVpKsouFVBxonQaJ24RdMPXSz2ezKri/fJnk+86yKmlsrAsjoQMUYEgzCwiCVgk7e
         P+h8rrnypyufIbN29W58WLN6tv+hMNO8moZ4oi7P55ml8A+Yd7uFb+6bse53WQaH24fc
         BYi+sngFitnqFvnQ13TGgJyb8NbV5jgjWfK8cdahAalL6KOVCQDeXCLiPAZd7pdAjv5l
         YZ1d7O5Kne4IKCu/yeX9tT2C3w6lwgOLkykeMGJqZDpDYAx9FsJ2HZZGQfaeeN/KZDgy
         xP4sFIR5dt+3MKSjobv9LcnH1ZDBZa7pGRrO1ibPUhCabKV3iAr/jUzvKH/dSOLf/AK7
         QR6g==
In-Reply-To: <20201106105833.GA13845@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Hi,

> Is "flush ruleset" at the very beginning of your firewall.nft file?

Yes it is, since when I run 'nft -f /etc/nftables/firewall.nft' I
don't want to end up with duplicate rules.

Even if I didn't explicitly put the 'flush statement' at the top of my
/etc/nftables/firewall.nft file, the systemd nftables.service file in
Fedora/RHEL/CentOS also flushes the ruleset before re-applying the
rules when running 'systemctl reload nftables', which I have always
perceived as a proper way to pull in firewall rule changes:

    [root@localhost system]# grep Reload
/usr/lib/systemd/system/nftables.service
    ExecReload=/sbin/nft 'flush ruleset; include
"/etc/sysconfig/nftables.conf";'

My whole way of thinking about atomic rule replacement is based on
https://wiki.nftables.org/wiki-nftables/index.php/Atomic_rule_replacement,
where it states that: "If you prepend the "flush table filter" line at
the very beginning of the filter-table file, you achieve atomic
rule-set replacement equivalent to what iptables-restore provides. The
kernel handles the rule commands in the file in one single
transaction, so basically the flushing and the load of the new rules
happens in one single shot. If you choose not to flush your tables
then you will see duplicate rules for each time you reloaded the
config."

Granted, I am have been using "flush ruleset" at the beginning of the
file, instead of the stated "flush table filter". However, since I may
have multiple tables in the file (filter, nat, etc.) with
indeterminate names, I went and assumed that "flush ruleset" was an
all-encompassing alternative to individual "flush table <tablename>"
statements.

That being said, I ran a test by replacing "flush ruleset" at the top
of my firewall.nft file with "flush table inet x" and I was surprised
to discover that, while "flush table inet x" *does* remove all
configured rules, thereby preventing duplicate rules, it does _not_
remove the devices from the flow table.

So:

    [root@localhost system]# cat /etc/nftables/firewall.nft
    flush table inet x

    table inet x {
        flowtable f {
                hook ingress priority 0;
    }
            chain y {
                    type filter hook forward priority 0; policy accept;
                    ip protocol tcp flow offload @f
                    counter packets 0 bytes 0
            tcp dport 80
            }
    }
    [root@localhost system]# nft -f /etc/nftables/firewall.nft
    [root@localhost system]# nft list ruleset
    table inet x {
        flowtable f {
            hook ingress priority filter
        }

        chain y {
            type filter hook forward priority filter; policy accept;
            ip protocol tcp flow add @f
            counter packets 0 bytes 0
            tcp dport 80
        }
    }
    [root@localhost system]# nft add flowtable inet x f { hook ingress
priority filter \; devices = { br0 } \; }
    [root@localhost system]# nft list ruleset
    table inet x {
        flowtable f {
            hook ingress priority filter
            devices = { br0 }
        }

        chain y {
            type filter hook forward priority filter; policy accept;
            ip protocol tcp flow add @f
            counter packets 0 bytes 0
            tcp dport 80
        }
    }
    [root@localhost system]# nft -f /etc/nftables/firewall.nft
    [root@localhost system]# nft list ruleset
    table inet x {
        flowtable f {
            hook ingress priority filter
            devices = { br0 }
        }

        chain y {
            type filter hook forward priority filter; policy accept;
            ip protocol tcp flow add @f
            counter packets 0 bytes 0
            tcp dport 80
        }
    }

Whereas:

    [root@localhost system]# cat /etc/nftables/firewall.nft
    flush ruleset

    table inet x {
        flowtable f {
                hook ingress priority 0;
    }
            chain y {
                    type filter hook forward priority 0; policy accept;
                    ip protocol tcp flow offload @f
                    counter packets 0 bytes 0
            tcp dport 80
            }
    }
    [root@localhost system]# nft -f /etc/nftables/firewall.nft
    [root@localhost system]# nft list ruleset
    table inet x {
        flowtable f {
            hook ingress priority filter
        }

        chain y {
            type filter hook forward priority filter; policy accept;
            ip protocol tcp flow add @f
            counter packets 0 bytes 0
            tcp dport 80
        }
    }
    [root@localhost system]# nft add flowtable inet x f { hook ingress
priority filter \; devices = { br0 } \; }
    [root@localhost system]# nft list ruleset
    table inet x {
        flowtable f {
            hook ingress priority filter
            devices = { br0 }
        }

        chain y {
            type filter hook forward priority filter; policy accept;
            ip protocol tcp flow add @f
            counter packets 0 bytes 0
            tcp dport 80
        }
    }
    [root@localhost system]# nft -f /etc/nftables/firewall.nft
    [root@localhost system]# nft list ruleset
    table inet x {
        flowtable f {
            hook ingress priority filter
        }

        chain y {
            type filter hook forward priority filter; policy accept;
            ip protocol tcp flow add @f
            counter packets 0 bytes 0
            tcp dport 80
        }
    }

This difference in behavior then begets a new question:

Does prepending the "more destructive" 'flush ruleset' statement at
the very beginning of the 'firewall.nft' file still honor the
"atomicity" guarantee of running 'nft -f' again this file, or is this
guarantee only honored when prepending 'flush table' statements? In
other words, is there a minute period after running 'flush ruleset' in
my file where the node is unprotected?

Thanks for your time,
-Martin
