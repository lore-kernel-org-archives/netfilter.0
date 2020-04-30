From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Is viewing a "candidate" ruleset in 'nft list ruleset' format possible?
Date: Thu, 30 Apr 2020 18:05:40 +1000
Message-ID: <87lfmdpfe3.fsf@goll.lan>
References: <CANf9dFNVrz_YjQ2Xe9vZP=U5h-3C7Hxk+oDz9rTD8Q4nALHO5A@mail.gmail.com>
        <87blnkqg1j.fsf@goll.lan>
        <CANf9dFN=DA1eP6W8A5GOAseXvB57_wf=U9Trjk6fY1M58qgfaA@mail.gmail.com>
        <20200423020613.GE30155@dimstar.local.net> <87ees5wt76.fsf@goll.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--=-=-=
Content-Type: text/plain

trentbuck@gmail.com (Trent W. Buck) writes:

> Duncan Roe <duncan_roe@optusnet.com.au> writes:
>
>> On Wed, Apr 22, 2020 at 12:34:26PM -0400, Martin Gignac wrote:
>>> > You can simply put "list ruleset" at the bottom of the foo.nft file.
>>> > However in my experience this routinely gives outright wrong rulesets
>>> > (as at nftables 0.9.1), so I don't trust it.
>>
>> "list ruleset" at the bottom of an nft script is completely accurate.
>> The command "nft list ruleset" discards portions of rules that are implicit, in the
>> interests of brevity.
>
> Sorry, I don't have a testable example.
> If I run into this again, I'll try to keep proper records so I can file
> a proper bug report!

Hooray, I got one (attached).

You can see "list ruleset" inside /etc/nftables.conf ends with

    table inet my_filter {
    }

where running "nft list ruleset" immediately afterwards, it shows all
the chains and rules that are actually there:

    table inet my_filter {
            chain my_input {
                    type filter hook input priority filter; policy drop;
                    jump my_prologue comment "deal with boring conntrack/loopback/ICMP/ICMPv6"
                    tcp dport 22 accept
                    jump my_epilogue
            }
    [...]
    }

It happens reliably if I run "nft delete table inet my_filter" before "/etc/nftables.conf",
but NOT if I run  "/etc/nftables.conf" before "/etc/nftables.conf".

To me this feels like "list ruleset" is sometimes running before the block
immediately before it.


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=tmp.txt
Content-Description: transcript showing "list ruleset" inside foo.nft giving
 weird output

root@zippy:~# nft delete table inet my_filter
root@zippy:~# /etc/nftables.conf
table ip filter {
	chain INPUT {
		type filter hook input priority filter; policy accept;
		iifname "virbr1" meta l4proto udp udp dport 53 counter packets 0 bytes 0 accept
		iifname "virbr1" meta l4proto tcp tcp dport 53 counter packets 0 bytes 0 accept
		iifname "virbr1" meta l4proto udp udp dport 67 counter packets 0 bytes 0 accept
		iifname "virbr1" meta l4proto tcp tcp dport 67 counter packets 0 bytes 0 accept
		iifname "virbr0" meta l4proto udp udp dport 53 counter packets 0 bytes 0 accept
		iifname "virbr0" meta l4proto tcp tcp dport 53 counter packets 0 bytes 0 accept
		iifname "virbr0" meta l4proto udp udp dport 67 counter packets 0 bytes 0 accept
		iifname "virbr0" meta l4proto tcp tcp dport 67 counter packets 0 bytes 0 accept
	}

	chain FORWARD {
		type filter hook forward priority filter; policy accept;
		iifname "virbr1" oifname "virbr1" counter packets 0 bytes 0 accept
		oifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		oifname "virbr0" ip daddr 192.168.122.0/24 ct state related,established counter packets 0 bytes 0 accept
		iifname "virbr0" ip saddr 192.168.122.0/24 counter packets 0 bytes 0 accept
		iifname "virbr0" oifname "virbr0" counter packets 0 bytes 0 accept
		oifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
	}

	chain OUTPUT {
		type filter hook output priority filter; policy accept;
		oifname "virbr1" meta l4proto udp udp dport 68 counter packets 0 bytes 0 accept
		oifname "virbr0" meta l4proto udp udp dport 68 counter packets 0 bytes 0 accept
	}
}
table ip6 filter {
	chain INPUT {
		type filter hook input priority filter; policy accept;
	}

	chain FORWARD {
		type filter hook forward priority filter; policy accept;
	}

	chain OUTPUT {
		type filter hook output priority filter; policy accept;
	}
}
table bridge filter {
	chain INPUT {
		type filter hook input priority filter; policy accept;
	}

	chain FORWARD {
		type filter hook forward priority filter; policy accept;
	}

	chain OUTPUT {
		type filter hook output priority filter; policy accept;
	}
}
table ip mangle {
	chain PREROUTING {
		type filter hook prerouting priority mangle; policy accept;
	}

	chain INPUT {
		type filter hook input priority mangle; policy accept;
	}

	chain FORWARD {
		type filter hook forward priority mangle; policy accept;
	}

	chain OUTPUT {
		type route hook output priority mangle; policy accept;
	}

	chain POSTROUTING {
		type filter hook postrouting priority mangle; policy accept;
		oifname "virbr1" meta l4proto udp udp dport 68 counter packets 0 bytes 0 # CHECKSUM fill
		oifname "virbr0" meta l4proto udp udp dport 68 counter packets 0 bytes 0 # CHECKSUM fill
	}
}
table ip nat {
	chain PREROUTING {
		type nat hook prerouting priority dstnat; policy accept;
	}

	chain INPUT {
		type nat hook input priority 100; policy accept;
	}

	chain POSTROUTING {
		type nat hook postrouting priority srcnat; policy accept;
		ip saddr 192.168.122.0/24 ip daddr 224.0.0.0/24 counter packets 0 bytes 0 return
		ip saddr 192.168.122.0/24 ip daddr 255.255.255.255 counter packets 0 bytes 0 return
		meta l4proto tcp ip saddr 192.168.122.0/24 ip daddr != 192.168.122.0/24 counter packets 0 bytes 0 masquerade to :1024-65535 
		meta l4proto udp ip saddr 192.168.122.0/24 ip daddr != 192.168.122.0/24 counter packets 0 bytes 0 masquerade to :1024-65535 
		ip saddr 192.168.122.0/24 ip daddr != 192.168.122.0/24 counter packets 0 bytes 0 masquerade 
	}

	chain OUTPUT {
		type nat hook output priority -100; policy accept;
	}
}
table ip sshguard {
	set attackers {
		type ipv4_addr
		flags interval
	}

	chain blacklist {
		type filter hook input priority filter - 10; policy accept;
		ip saddr @attackers drop
	}
}
table ip6 sshguard {
	set attackers {
		type ipv6_addr
		flags interval
	}

	chain blacklist {
		type filter hook input priority filter - 10; policy accept;
		ip6 saddr @attackers drop
	}
}
table inet my_filter {
}
root@zippy:~# nft list ruleset
table ip filter {
	chain INPUT {
		type filter hook input priority filter; policy accept;
		iifname "virbr1" meta l4proto udp udp dport 53 counter packets 0 bytes 0 accept
		iifname "virbr1" meta l4proto tcp tcp dport 53 counter packets 0 bytes 0 accept
		iifname "virbr1" meta l4proto udp udp dport 67 counter packets 0 bytes 0 accept
		iifname "virbr1" meta l4proto tcp tcp dport 67 counter packets 0 bytes 0 accept
		iifname "virbr0" meta l4proto udp udp dport 53 counter packets 0 bytes 0 accept
		iifname "virbr0" meta l4proto tcp tcp dport 53 counter packets 0 bytes 0 accept
		iifname "virbr0" meta l4proto udp udp dport 67 counter packets 0 bytes 0 accept
		iifname "virbr0" meta l4proto tcp tcp dport 67 counter packets 0 bytes 0 accept
	}

	chain FORWARD {
		type filter hook forward priority filter; policy accept;
		iifname "virbr1" oifname "virbr1" counter packets 0 bytes 0 accept
		oifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		oifname "virbr0" ip daddr 192.168.122.0/24 ct state related,established counter packets 0 bytes 0 accept
		iifname "virbr0" ip saddr 192.168.122.0/24 counter packets 0 bytes 0 accept
		iifname "virbr0" oifname "virbr0" counter packets 0 bytes 0 accept
		oifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
		iifname "virbr0" counter packets 0 bytes 0 reject
		iifname "virbr1" counter packets 0 bytes 0 reject
	}

	chain OUTPUT {
		type filter hook output priority filter; policy accept;
		oifname "virbr1" meta l4proto udp udp dport 68 counter packets 0 bytes 0 accept
		oifname "virbr0" meta l4proto udp udp dport 68 counter packets 0 bytes 0 accept
	}
}
table ip6 filter {
	chain INPUT {
		type filter hook input priority filter; policy accept;
	}

	chain FORWARD {
		type filter hook forward priority filter; policy accept;
	}

	chain OUTPUT {
		type filter hook output priority filter; policy accept;
	}
}
table bridge filter {
	chain INPUT {
		type filter hook input priority filter; policy accept;
	}

	chain FORWARD {
		type filter hook forward priority filter; policy accept;
	}

	chain OUTPUT {
		type filter hook output priority filter; policy accept;
	}
}
table ip mangle {
	chain PREROUTING {
		type filter hook prerouting priority mangle; policy accept;
	}

	chain INPUT {
		type filter hook input priority mangle; policy accept;
	}

	chain FORWARD {
		type filter hook forward priority mangle; policy accept;
	}

	chain OUTPUT {
		type route hook output priority mangle; policy accept;
	}

	chain POSTROUTING {
		type filter hook postrouting priority mangle; policy accept;
		oifname "virbr1" meta l4proto udp udp dport 68 counter packets 0 bytes 0 # CHECKSUM fill
		oifname "virbr0" meta l4proto udp udp dport 68 counter packets 0 bytes 0 # CHECKSUM fill
	}
}
table ip nat {
	chain PREROUTING {
		type nat hook prerouting priority dstnat; policy accept;
	}

	chain INPUT {
		type nat hook input priority 100; policy accept;
	}

	chain POSTROUTING {
		type nat hook postrouting priority srcnat; policy accept;
		ip saddr 192.168.122.0/24 ip daddr 224.0.0.0/24 counter packets 0 bytes 0 return
		ip saddr 192.168.122.0/24 ip daddr 255.255.255.255 counter packets 0 bytes 0 return
		meta l4proto tcp ip saddr 192.168.122.0/24 ip daddr != 192.168.122.0/24 counter packets 0 bytes 0 masquerade to :1024-65535 
		meta l4proto udp ip saddr 192.168.122.0/24 ip daddr != 192.168.122.0/24 counter packets 0 bytes 0 masquerade to :1024-65535 
		ip saddr 192.168.122.0/24 ip daddr != 192.168.122.0/24 counter packets 0 bytes 0 masquerade 
	}

	chain OUTPUT {
		type nat hook output priority -100; policy accept;
	}
}
table ip sshguard {
	set attackers {
		type ipv4_addr
		flags interval
	}

	chain blacklist {
		type filter hook input priority filter - 10; policy accept;
		ip saddr @attackers drop
	}
}
table ip6 sshguard {
	set attackers {
		type ipv6_addr
		flags interval
	}

	chain blacklist {
		type filter hook input priority filter - 10; policy accept;
		ip6 saddr @attackers drop
	}
}
table inet my_filter {
	chain my_input {
		type filter hook input priority filter; policy drop;
		jump my_prologue comment "deal with boring conntrack/loopback/ICMP/ICMPv6"
		tcp dport 22 accept
		jump my_epilogue
	}

	chain my_forward {
		type filter hook forward priority filter; policy drop;
		jump my_prologue comment "deal with boring conntrack/loopback/ICMP/ICMPv6"
		jump my_epilogue
	}

	chain my_prologue {
		ct state vmap { invalid : drop, established : accept, related : accept }
		ct status dnat accept
		meta iiftype loopback accept
		icmp type echo-request accept
		icmpv6 type { echo-request, nd-router-advert, nd-neighbor-solicit, nd-neighbor-advert } accept
	}

	chain my_epilogue {
	}
}
root@zippy:~# cat /etc/nftables.conf
#!/usr/sbin/nft --file

## NOTE: we add+delete each table (not "flush ruleset"), because
##       otherwise we would wipe out sshguard & libvirtd tables.
#flush ruleset
add table inet my_filter        # idempotent
delete table inet my_filter     # not idempotent


table inet my_filter {
    chain my_input {
        type filter hook input priority filter
        policy drop
        jump my_prologue  comment "deal with boring conntrack/loopback/ICMP/ICMPv6"

        # YOUR RULES HERE.
        # NOTE: service names resolve via nss (/etc/hosts) only in nft 0.9.1+!
        tcp dport ssh  accept
        jump my_epilogue
    }
    chain my_forward {
        type filter hook forward priority filter
        policy drop
        jump my_prologue  comment "deal with boring conntrack/loopback/ICMP/ICMPv6"
        # YOUR RULES HERE.
        jump my_epilogue
    }
    # We want output to be "allow all", so we don't even create a chain.
    #chain my_output {
    #    type filter hook output priority filter
    #    policy accept
    #}

    chain my_prologue {
        ct state vmap { established: accept, related: accept, invalid: drop }
        ct status dnat  accept
        iiftype loopback  accept
        icmp type echo-request  accept
        icmpv6 type {
            echo-request,
            nd-neighbor-solicit,
            nd-router-advert,
            nd-neighbor-advert }  accept
    }
    chain my_epilogue {
    }
}

# This is here to aid debugging.
# Note that its output WILL NOT MATCH a later "nft list ruleset".
list ruleset
root@zippy:~# dpkg-query -W nftables
nftables	0.9.3-2~bpo10+1
root@zippy:~# nft --version
nftables v0.9.3 (Topsy)
root@zippy:~# uname -a
Linux zippy 5.4.0-0.bpo.4-amd64 #1 SMP Debian 5.4.19-1~bpo10+1 (2020-03-09) x86_64 GNU/Linux
root@zippy:~# 

--=-=-=--

