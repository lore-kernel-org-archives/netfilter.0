From: Dade <mailing@cantine.org>
Subject: DROP Fin Scan
Date: Thu, 12 Dec 2002 15:27:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039703255.3df89cd74ff10@zigzag.cantine.org>
References: <20021124093933.24186.71076.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021124093933.24186.71076.Mailman@kashyyyk>
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
To: netfilter@lists.netfilter.org

: 

Hi, 
I'd like to block all FIN SCAN type. In Internet I find the following method: 

iptables -A INPUT -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP 

but for me is better to write: 

iptables -A FORWARD -m state -state NEW -p tcp --tcp-flags FIN FIN -j DROP 

that means blocking all packets with flag FIN active regarding only packets 
belonging to new TCP connections. 
Are you agree? 
Thanks in advance, 
Davide

 
 





Scrive netfilter-request@lists.netfilter.org:

> Send netfilter mailing list submissions to
> 	netfilter@lists.netfilter.org
> 
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body 'help' to
> 	netfilter-request@lists.netfilter.org
> 
> You can reach the person managing the list at
> 	netfilter-admin@lists.netfilter.org
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of netfilter digest..."
> 
> 
> Today's Topics:
> 
>    1. Re: Am I making a bone-headed mistake with patch-o-matic ? (Brandon
> Broyles)
>    2. Packet filtering on the application layer (James Stickland)
>    3. Re: SNAT & Squence Numbers (Dax Kelson)
>    4. =?iso-8859-1?Q?Iptables_with_IP_Alias?=
> (=?iso-8859-1?Q?Juliano_Dapper?=)
>    5. cannot open shared object file: no such file or directory (James
> Stickland)
>    6. Re: [squid-users] How to allow traffic other than http (Colin
> Campbell)
>    7. DNAT to localhost (Nix N. Nix)
>    8. Re: Time based rules ... (Chris Poupart)
>    9. Netfilter 1.2.7a (debian), rule (DNAT) problems (040)
>   10. Re: Trojaned tcpdump and libpcap (Michael H. Warfield)
>   11. New to IP Tables (David Reta)
> 
> --__--__--
> 
> Message: 1
> From: "Brandon Broyles" <netfilter@drbroyles.com>
> To: <fabrice@netfilter.org>,
> 	<netfilter@lists.netfilter.org>
> Subject: Re: Am I making a bone-headed mistake with patch-o-matic ?
> Date: Sun, 24 Nov 2002 00:53:26 -0500
> 
> 
> ----- Original Message ----- 
> From: "Fabrice MARIE" <fabrice@netfilter.org>
> To: <netfilter@drbroyles.com>; <netfilter@lists.netfilter.org>
> Sent: Saturday, November 23, 2002 11:43 PM
> Subject: Re: Am I making a bone-headed mistake with patch-o-matic ?
> 
> > There is a problem though (fixed in the CVS, but not yet updated on the
> HTML page..)
> > you shouldn't run # make patch-o-matic, but instead from the
> patch-o-matic
> directory,
> > you should run the ./runme script with the patch suite you want to apply
> as a parameter.
> > The corrected SGML source of the document is there :
> >
> http://cvs.netfilter.org/cgi-bin/cvsweb/~checkout~/netfilter/documentation/H
> OWTO/netfilter-extensions-HOWTO.sgml
> 
> 
> From what I read in the above link, I think something may be wrong with my
> patch-o-matic I got via CVS.  I ran a (./runme base) and I got the
> following
> output.  In this output the only thing that is "Already applied:" is the
> first line.  Nothing else seems to be applied after that.  Plus, that link
> above references  switches ( Do you want to apply this patch [N/y/t/f/q/?]
> )
> that I am not getting.
> 
> *********************************************************************
> Each patch is a new feature: many have minimal impact, some do not.
> Almost every one has bugs, so I don't recommend applying them all!
> -------------------------------------------------------
> Already applied: submitted/2.4.18
>                  submitted/ahesp-static
>                  submitted/arptables
>                  submitted/config-cleanup
>                  submitted/conntrack?helper-unregister
>                  submitted/conntrack
>                  submitted/dscp
>                  submitted/DSCP
>                  submitted/ecn
>                  submitted/ECN
>                  submitted/helper
>                  submitted/ip6tables-export-symbols
>                  submitted/ip6tables-exthdr-bug-ipv6
>                  submitted/ip_conntrack_protocol_destroy
>                  submitted/ip_conntrack_protocol_unregister
>                  submitted/ip_nat_irc-srcaddr-fix
>                  submitted/ipt_MIRROR-ttl
>                  submitted/ipt_REJECT-checkentry
>                  submitted/ipt_unclean-ecn
>                  submitted/ipv6-agr-ipv6
>                  submitted/irc-dcc-mask
>                  submitted/length-ipv6
>                  submitted/local-nat
>                  submitted/log-tunnel-fix-ipv6
>                  submitted/macro-trailing-semicolon-fix
>                  submitted/mangle5hooks
>                  submitted/nat-export_symbols
>                  submitted/nat-memoryleak-fix
>                  submitted/netfilter-arp
>                  submitted/ownercmd
>                  submitted/pkttype
>                  submitted/REJECT-dont_fragment
>                  submitted/REJECT_mark
>                  submitted/remove_no_version
>                  submitted/skb_clone_copy
>                  submitted/TOS-oops-fix
>                  submitted/ulog-module-unload
>                  submitted/ulog-nlgroup-shift-fix
>                  submitted/ulog-sparc-bitops-fix
>                  submitted/unclean-udpchecksum
>                  submitted/z-newnat16
>                  submitted/z-newnat_assertfix
>                  submitted/z-newnat_changeexpect-lockfix
>                  pending/newnat-udp-helper
>                  base/ahesp6-ipv6
>                  base/frag6-ipv6
>                  base/fuzzy
>                  base/iplimit
>                  base/ipt_unclean-ubit
>                  base/ipv4options
>                  base/IPV4OPTSSTRIP
>                  base/ipv6header-ipv6
>                  base/mport
>                  base/NETLINK
>                  base/NETMAP
>                  base/nth
>                  base/opts6-ipv6
>                  base/pool
>                  base/psd
>                  base/quota
>                  base/random
>                  base/realm
>                  base/REJECT-ipv6
>                  base/route6-ipv6
>                  base/SAME
>                  base/time
>                  base/TTL
> 
> -----------------------------------------------------------------
> No more patches to apply! Q to Quit or ? for options [Q/a/r/b/?]
> Excellent! Kernel is now ready for compilation.
> *********************************************************************
> 
> I never get a chance to choose which patches I wish to install.  Before I
> wrote that first message to this mail list, I had already tried recompiling
> the kernel and iptables after I ran (./runme base).  Does it look like my
> patch-o-matic is working incorrectly?
> 
> Thanks,
> Brandon Broyles
> 
> 
> 
> 
> --__--__--
> 
> Message: 2
> Date: Mon, 11 Nov 2002 23:25:35 -0500 (EST)
> From: James Stickland <jimmy@sympatico.ca>
> To:  <netfilter@lists.netfilter.org>
> Subject: Packet filtering on the application layer
> 
> Is there any way with linux (or just netfilter) to filter out packets
> based upon whats analyzed in the application layer of a packet?
> 
> 
> 
> 
> --__--__--
> 
> Message: 3
> Subject: Re: SNAT & Squence Numbers
> From: Dax Kelson <Dax.Kelson@gurulabs.com>
> To: mike bramm <mike.bramm@bomberjacketproductions.com>
> Cc: netfilter@lists.netfilter.org
> Organization: Guru Labs
> Date: 12 Nov 2002 01:22:42 -0700
> 
> On Mon, 2002-11-11 at 10:23, mike bramm wrote:
> > Hi, 
> >     I'm a Router/PIX guy that is just getting into the Linux/IPTables
> > scene. I've read the man pages and searched the web for information on
> > IPTables. And I'm not able to find answers to some of my questions.
> > Maybe you can help? 
> >       * If SNAT is configured for many to one (PAT), then I would
> >         presume that the connections are tracked by sequence numbers.
> >         Are the sequence numbers picked randomly, like the PIX? And is
> >         there a range in with they are picked from? What mod does
> >         this?
> 
> AFAIK, the sequence numbers are left intact. I could be wrong though. A
> quick check with a packet sniffer should answer this.
> 
> >       * A syntax question. I've looked at alot of syntax examples and
> >         I've noticed one character that I can't seem to match up with
> >         any of the tutorials or man
> >         pages.                                                             
>                                            $IPTABLES -A INPUT $WAN_IFACE \ -j
> DROP   What the heck is "\"? It looks like it would be used to separate the
> match and the target, but is not really necessary. Is this just a personal
> preference or is it needed?
> 
> This isn't iptables syntax at all. 
> 
> The "\" at the end of a line is known as the continuation character.
> This is bourne shell syntax. It means that the next line should be
> treated as a continuation of the current line. The "\" character NOT at
> the end of the line, is the escape character and removes any special
> treatment of the following character and causes it to be treated
> literally.
> 
> Dax
> 
> 
> 
> --__--__--
> 
> Message: 4
> Date: Wed, 13 Nov 2002 01:12:17 +0000
> Subject: =?iso-8859-1?Q?Iptables_with_IP_Alias?=
> From: "=?iso-8859-1?Q?Juliano_Dapper?=" <fjdapper@terra.com.br>
> To: "=?iso-8859-1?Q?netfilter?=" <netfilter@lists.netfilter.org>
> 
> What's iptables not accept rules in ip alias, eth0:0, eth0:1?=0D=0AI have=
>  a linux box with 2 ips and i have create ruls to redirect traffic to int=
> ernal machine,ex:=0D=0Aiptables -t nat -A PREROUTING -p tcp -i eth0 --dpo=
> rt 25 -j DNAT --to 192.168.0.1=0D=0Aiptables -t nat -A PREROUTING -p tcp =
> -i etho:0 --dport 80 -j DNAT --to=0D=0A192.168.0.2=0D=0Aeth0 - 200.200.20=
> 0.1=0D=0Aeth0:0 - 200.200.200.2=0D=0A=0D=0ATkz...=0D=0A=0D=0A=0D=0A=0D=0A=
> 
> 
> 
> 
> --__--__--
> 
> Message: 5
> Date: Tue, 12 Nov 2002 21:27:38 -0500 (EST)
> From: James Stickland <jimmy@sympatico.ca>
> To:  <netfilter@lists.netfilter.org>
> Subject: cannot open shared object file: no such file or directory
> 
> Hi, i recently ran patch-o-matic to patch my kernel for the string match
> from the extra patches.
> 
> I ran patch-o-matic, and it copied the string files to
> /usr/src/linux/net/ipv4/netfilter.  Ok, so far so good.
> 
> I went to compile my kernel, and have ipt_string as a module.  I did so by
> adding the line CONFIG_IP_NF_MATCH_STRING=m in my /usr/src/linux/.config.
> 
> I proceeded to do the standard make dep ; make modules ; make
> modules_install ; make bzImage.  THe kernel compiled, i rebooted, and was
> successfully able to modprobe ipt_string.
> (/lib/modules/2.4.19/kernel/net/ipv4/netfilter/ipt_string.o)
> 
> However, when i went to make use of the ipt_string match in an iptables
> rule, i was given the following error:
> 
> iptables v1.2.7a: Couldn't load match
> `string':/usr/local/lib/iptables/libipt_st
> ring.so: cannot open shared object file: No such file or directory
> 
> Upon inspection, the libipt_string.so did not exist in
> /usr/local/lib/iptables.  How do i get this netfilter library to exist?
> 
> I had this problem the last time i patched my kernel to support ipt_psd,
> but i cannot recall how i was able to get the psd library to exist.
> 
> Did i miss a step while patching this time?  Anyone with help please
> respond to the list and my email directly - jamesstickland@sympatico.ca
> 
> Thank you.
> 
> 
> 
> 
> 
> 
> --__--__--
> 
> Message: 6
> Date: Wed, 13 Nov 2002 16:34:21 +1000 (EST)
> From: Colin Campbell <sgcccdc@citec.qld.gov.au>
> To: Glen Spidal <glens@cybercorpinc.com>
> Cc: Net Filter <netfilter@lists.netfilter.org>,
>    Squid Users <squid-users@squid-cache.org>
> Subject: Re: [squid-users] How to allow traffic other than http
> 
> On Tue, 12 Nov 2002, Glen Spidal wrote:
> 
> > I have servers set up as diagramed below.  Proxied web traffic work fine.
> > Email fails.
> > I can send mail from the Linux box via Pine.  Email server is at external
> > ISP.
> 
> Squid is an HTTP proxy. Either run an MTA (sendmail, postfix, exim, qmail,
> ....) on the squid server or let the wintel clients talk to the ISP's mail
> server  by routing (and natting?) through the squid server.
> 
>  Colin
> --
> Colin Campbell
> Unix Support/Postmaster/Hostmaster
> CITEC
> +61 7 3227 6334
> 
> 
> 
> --__--__--
> 
> Message: 7
> Subject: DNAT to localhost
> From: "Nix N. Nix" <nix@go-nix.ca>
> To: netfilter@lists.samba.org
> Organization: 
> Date: 13 Nov 2002 03:45:54 -0500
> 
> Why doesn't this work ?
> 
> /sbin/iptables -t nat -A PREROUTING -p udp --destination 192.168.1.1/32
> --dport 80 -j DNAT --to-destination 127.0.0.1:8080
> 
> The idea is:  The Web server listens solely on 127.0.0.1:8080 .  This
> allows me to run a Web server as a non-root user.  But then, I want
> ${OUTSIDE_IP}:80 and 192.168.1.1:80 (my interface) to be forwarded to
> 127.0.0.1:8080 .  I'm sure you've guessed by now that I'm running the
> Web server on my firewall ;o)
> 
> Anyway, I tried setting /proc/sys/net/ipv4/conf/lo/rp_filter to 0, but
> that didn't help either.
> 
> IMHO, the reason this doesn't work is that the above rule is added at
> the PREROUTING stage of the game.  So, when the packet is routed, the
> routing decision is based on 
> +----------------------+
> |  Packet              |
> +----------------------+
> |source:<192.168.1.xxx>|
> |dest:  <127.0.0.1>    |
> +----------------------+
> and, of course, somewhere, this packet gets dropped, because nothing
> should be able to reach 127.0.0.0/8 but 127.0.0.0/8, right ?  But hell,
> I'm no expert.
> 
> So, is there any way to forward TCP ports from local interfaces to the
> loopback interface ?
> 
> 
> 
> Thanks for your advice.
> 
> 
> 
> --__--__--
> 
> Message: 8
> Date: Wed, 13 Nov 2002 11:00:37 -0500
> From: Chris Poupart <chris.poupart@mcgill.ca>
> To: Raymond Leach <raymondl@knowledgefactory.co.za>
> CC: Netfilter Mailing List <netfilter@lists.netfilter.org>
> Subject: Re: Time based rules ...
> 
> 
> This is a cryptographically signed message in MIME format.
> 
> --------------ms030200050104000308010508
> Content-Type: text/plain; charset=us-ascii; format=flowed
> Content-Transfer-Encoding: 7bit
> 
> Couldn't you just use a CRON job to add and remove that rule at the 
> required times?
> 
> -- Chris
> 
> Raymond Leach wrote:
> > Hi
> > 
> > Is there a way to put time restrictions on rules?
> > For eaxmple, something like:
> > 
> > iptables -A FORWARD -i eth0 -p tcp -sport 1024: -dport 1024: -time
> > 0700:1700 -j DROP
> > 
> > It would be nice ...
> > 
> > Ray
> > -- 
> 
> 
> --------------ms030200050104000308010508
> Content-Type: application/x-pkcs7-signature; name="smime.p7s"
> Content-Transfer-Encoding: base64
> Content-Disposition: attachment; filename="smime.p7s"
> Content-Description: S/MIME Cryptographic Signature
> 
> MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJXDCC
> AwwwggJ1oAMCAQICAwhdizANBgkqhkiG9w0BAQQFADCBkjELMAkGA1UEBhMCWkExFTATBgNV
> BAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUx
> HTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVl
> bWFpbCBSU0EgMjAwMC44LjMwMB4XDTAyMDkyNzE3MTczNloXDTAzMDkyNzE3MTczNlowSTEf
> MB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEmMCQGCSqGSIb3DQEJARYXY2hyaXMu
> cG91cGFydEBtY2dpbGwuY2EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC4eF7z
> tl0IE3iJFRn+QxzBIYj9kv5bkCa3oB0ZcsGxoYoVoTKXPKmiI/CvhpNUKG3EgffmNsO1bsiW
> yoyX29ex3bjSUvXUp7rUdl4z/LlgTsPXOpfuXnt1d719kpn5yAPI3yzCBjjtwrEb1X7XUIcP
> iLW8kAwMn12a6m7ym7UUGuFALwIB3LkOiO0OnT46s5ePDLWwSLgRNamTT+DSgi5thUktZAhk
> jPcOwzrfvYH8+/BPbGpgjtUQjWE/prOI/MwAG+CUnFXFc72OjJsdBpUj0mRKiDpsVH6u0LWe
> lnxtnRWc40zdhl4zYvM3+t110RFmEsf9fl8qig2sc9noV4YBAgMBAAGjNDAyMCIGA1UdEQQb
> MBmBF2NocmlzLnBvdXBhcnRAbWNnaWxsLmNhMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEE
> BQADgYEA2R04OiFqWwqdpxeCGJQflyooYzpl7T+vXXizBMOLAcn6ecXf+na9O2AOFTOVLZ83
> kR0jg5vX7GJpvVDM+qBkQqyqCgsDElXxzizOEFwMZwbNcEl3lA1wxLwwcvICZlfAZsn1dNGo
> NZrZ2castGJgIf64I1YmlnxwX82nJDQJ1dQwggMMMIICdaADAgECAgMIXYswDQYJKoZIhvcN
> AQEEBQAwgZIxCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcT
> CUNhcGUgVG93bjEPMA0GA1UEChMGVGhhd3RlMR0wGwYDVQQLExRDZXJ0aWZpY2F0ZSBTZXJ2
> aWNlczEoMCYGA1UEAxMfUGVyc29uYWwgRnJlZW1haWwgUlNBIDIwMDAuOC4zMDAeFw0wMjA5
> MjcxNzE3MzZaFw0wMzA5MjcxNzE3MzZaMEkxHzAdBgNVBAMTFlRoYXd0ZSBGcmVlbWFpbCBN
> ZW1iZXIxJjAkBgkqhkiG9w0BCQEWF2NocmlzLnBvdXBhcnRAbWNnaWxsLmNhMIIBIjANBgkq
> hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuHhe87ZdCBN4iRUZ/kMcwSGI/ZL+W5Amt6AdGXLB
> saGKFaEylzypoiPwr4aTVChtxIH35jbDtW7IlsqMl9vXsd240lL11Ke61HZeM/y5YE7D1zqX
> 7l57dXe9fZKZ+cgDyN8swgY47cKxG9V+11CHD4i1vJAMDJ9dmupu8pu1FBrhQC8CAdy5Dojt
> Dp0+OrOXjwy1sEi4ETWpk0/g0oIubYVJLWQIZIz3DsM6372B/PvwT2xqYI7VEI1hP6aziPzM
> ABvglJxVxXO9joybHQaVI9JkSog6bFR+rtC1npZ8bZ0VnONM3YZeM2LzN/rdddERZhLH/X5f
> KooNrHPZ6FeGAQIDAQABozQwMjAiBgNVHREEGzAZgRdjaHJpcy5wb3VwYXJ0QG1jZ2lsbC5j
> YTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBANkdODohalsKnacXghiUH5cqKGM6
> Ze0/r114swTDiwHJ+nnF3/p2vTtgDhUzlS2fN5EdI4Ob1+xiab1QzPqgZEKsqgoLAxJV8c4s
> zhBcDGcGzXBJd5QNcMS8MHLyAmZXwGbJ9XTRqDWa2dnGrLRiYCH+uCNWJpZ8cF/NpyQ0CdXU
> MIIDODCCAqGgAwIBAgIQZkVyt8x09c9jdkWE0C6RATANBgkqhkiG9w0BAQQFADCB0TELMAkG
> A1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRow
> GAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2
> aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSsw
> KQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAwMDgzMDAw
> MDAwMFoXDTA0MDgyNzIzNTk1OVowgZIxCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJu
> IENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEPMA0GA1UEChMGVGhhd3RlMR0wGwYDVQQLExRD
> ZXJ0aWZpY2F0ZSBTZXJ2aWNlczEoMCYGA1UEAxMfUGVyc29uYWwgRnJlZW1haWwgUlNBIDIw
> MDAuOC4zMDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA3jMypmPHCSVFPtJueCdngcXa
> iBmClw7jRCmKYzUqbXA8+tyu9+50bzC8M5B/+TRxoKNtmPHDT6Jl2w36S/HW3WGl+YXNVZo1
> Gp2Sdagnrthy+boC9tewkd4c6avgGAOofENCUFGHgzzwObSbVIoTh/+zm51JZgAtCYnslGvp
> oWkCAwEAAaNOMEwwKQYDVR0RBCIwIKQeMBwxGjAYBgNVBAMTEVByaXZhdGVMYWJlbDEtMjk3
> MBIGA1UdEwEB/wQIMAYBAf8CAQAwCwYDVR0PBAQDAgEGMA0GCSqGSIb3DQEBBAUAA4GBADGx
> S0dd+QFx5fVTbF151j2YwCYTYoEipxL4IpXoG0m3J3sEObr85vIk65H6vewNKjj3UFWobPcN
> rUwbvAP0teuiR59sogxYjTFCCRFssBpp0SsSskBdavl50OouJd2K5PzbDR+dAvNa28o89kTq
> JmmHf0iezqWf54TYyWJirQXGMYIDJzCCAyMCAQEwgZowgZIxCzAJBgNVBAYTAlpBMRUwEwYD
> VQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEPMA0GA1UEChMGVGhhd3Rl
> MR0wGwYDVQQLExRDZXJ0aWZpY2F0ZSBTZXJ2aWNlczEoMCYGA1UEAxMfUGVyc29uYWwgRnJl
> ZW1haWwgUlNBIDIwMDAuOC4zMAIDCF2LMAkGBSsOAwIaBQCgggFhMBgGCSqGSIb3DQEJAzEL
> BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTAyMTExMzE2MDAzN1owIwYJKoZIhvcNAQkE
> MRYEFPPTeVlaU6CriiJOR4LZx+r6wQHOMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZIhvcNAwcw
> DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEo
> MIGtBgsqhkiG9w0BCRACCzGBnaCBmjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
> cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsT
> FENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0Eg
> MjAwMC44LjMwAgMIXYswDQYJKoZIhvcNAQEBBQAEggEAoB1OfLfTqsK2qcx8rvWr2BjmUAf2
> lZptBBFjTllqjMOSSBf1uQW3pkKEgtRInTtpgO8n6GMaOufBeP6qqYL3F/D0lOwcn3R/E7my
> 0o8+dAN59mmI7X/CfKJFqPdob7VqPxTfp6fXr+gVxDcbG3WKfYkdpF2oDU9Z0TFaMKpZ76Zg
> OaF6May1hkzxVsuQgG3YZmzQleelN9X4kDCu4gfMfLSm2uWRjGuPV+EA+0CzIrHMt7kilkfo
> LBnN7NGRqMRZ6aydF6CQ8KS7ptV5KF5xTgMOr4m4IlDwl5PP6QJNZ2I4qFWe2eIHTWNqhiZa
> b7vNjCLgvG42EDyKPdHZfpZw6wAAAAAAAA==
> --------------ms030200050104000308010508--
> 
> 
> 
> --__--__--
> 
> Message: 9
> Date: Wed, 13 Nov 2002 17:41:57 +0100
> To: netfilter@lists.netfilter.org
> From: 040 <madmac@swipnet.se>
> Subject: Netfilter 1.2.7a (debian), rule (DNAT) problems
> 
> Hello.
> 
> First of all my configuration is:
> Debian Linux 3.0r0 w/ kernel 2.4.18-K7 on a x86 AMD Duron on a via KT133A 
> chipset.
> The system is configured with two NIC's, namely two 3Com 3C905C 10/100-TX 
> PCI networking cards and is acting part as
> a server and part as a router. I use it for serving things like web to the 
> outside and a router to enable internet access via it
> from my lan because my ISP only hands me one IP address. if it's of any 
> importance I hand out IP addresses to my lan
> via dhcpd, oh yea, it's a switched 10/100 mbit ethernet network.
> eth1 (dynamic, 217.208.248.*) is connected to the net and eth0 (static, 
> 192.168.0.1) is connected to the lan.
> 
> I've read the NAT HOWTO on netfilter.org and setted up masquadering like 
> (from my ruleset):
> -A POSTROUTING -o eth1 -j MASQUERADE
> and I've also done the following:
> echo 1 > /proc/sys/net/ipv4/ip_forward
> and edited /etc/network/options to correspond with the variable
> ip_forward=yes
> Which works fine, I'm able to access the net via all the clients on my LAN 
> when using the server as my gateway.
> 
> Now I want to add a rule to forward all incoming data on port 4662 (TCP) 
> from the internet (eth1) to
> a server on my LAN, namely host 192.168.0.7 (via eth0), so I add the 
> following rule (under *nat):
> -A PREROUTING -p tcp -m tcp -i eth1 --dport 4662 -j DNAT --to-destination 
> 192.168.0.7:4662
> 
> After reloading iptables and trying to connect or scan the port 4662 on my 
> external IP, nothing happends, i.e. the port is closed (yes, the
> client is listening on 4662 but does not recive any connections from the 
> server's eth0 (192.168.0.1)).
> 
> Anyone have any ideas for me?
> 
> I'm providing a copy of my ruleset made with iptables-save to provide 
> additional techincal information:
> 
> # Generated by iptables-save v1.2.7a on Sun Nov 10 17:58:44 2002
> *nat
> :OUTPUT ACCEPT [0:0]
> :PREROUTING ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> -A PREROUTING -p tcp -m tcp -i eth1 --dport 4662 -j DNAT --to-destination 
> 192.168.0.7:4662
> -A POSTROUTING -o eth1 -j MASQUERADE
> COMMIT
> 
> 
> Please note, I've tried to fiddle-around with the rules _alot_ so the above
> 
> is not a specific case of not-working rather than just one out of 100
> examples.
> 
> Thanks in advance.
> Henric Blomgren / Sweden.
> 
> 
> 
> --__--__--
> 
> Message: 10
> Date: Wed, 13 Nov 2002 12:10:26 -0500
> From: "Michael H. Warfield" <mhw@wittsend.com>
> To: James Miller <jimm@simutronics.com>
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Trojaned tcpdump and libpcap
> 
> 
> --TA4f0niHM6tHt3xR
> Content-Type: text/plain; charset=us-ascii
> Content-Disposition: inline
> Content-Transfer-Encoding: quoted-printable
> 
> On Wed, Nov 13, 2002 at 10:25:30AM -0600, James Miller wrote:
> > Hello all
> 
> > I have been a long time reader of this list.  An associate passed this
> al=
> ong
> > to me this morning and I wanted to share it with everyone.
> 
> > http://hlug.fscker.com/
> > Latest libpcap & tcpdump sources from tcpdump.org contain a trojan.
> 
> > Affected version are:
> > libpcap-0.7.1.tar.gz
> > tcpdump-3.6.2.tar.gz
> > tcpdump-3.7.1.tar.gz
> 
> 	Downloads from October 30 have been confirmed good.  Downloads
> after November 12 confirmed bad.  Anything in-between is anyone's guess.
> If anyone downloaded those sources between those two dates, please contact
> me with the package md5sums.  I want to narrow down the time frame.
> CVS repository does NOT appear to have been compromised.
> 
> 	Good:
> 
> 03e5eac68c65b7e6ce8da03b0b0b225e  tcpdump-3.7.1.tar.gz
> 0597c23e3496a5c108097b2a0f1bd0c7  libpcap-0.7.1.tar.gz
> 
> 	Bad:
> 
> 3c410d8434e63fb3931fe77328e4dd88  tcpdump-3.7.1.bad.tar.gz
> 73ba7af963aff7c9e23fa1308a793dca  libpcap-0.7.1.bad.tar.gz
> 
> > Regards,
> > Jim
> 
> 	Mike
> --=20
>  Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
>   /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   | 
> http://www.wittsend.com/=
> mhw/
>   NIC whois:  MHW9      |  An optimist believes we live in the best of all
>  PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!
> 
> --TA4f0niHM6tHt3xR
> Content-Type: application/pgp-signature
> Content-Disposition: inline
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
> 
> iQCVAwUBPdKHguHJS0bfHdRxAQGAnAQAwNm/9IzDza90dxhposTZoeVtgzjjeipY
> BJlgyhbeyLKvC5DoBMxn7eW29tl7+4e4FFQOsMKkaCyw+sCbc12hb3hWlNLzQeGO
> DrVpeLCaZsFuEZndl9Y7c7dLQvl4jUZVoLgIR8TDUXv9oz0TvjTA+1MUWZ/bEDPP
> xpkiaOEc1yg=
> =gt4S
> -----END PGP SIGNATURE-----
> 
> --TA4f0niHM6tHt3xR--
> 
> 
> --__--__--
> 
> Message: 11
> From: David Reta <DavidR@Narus.com>
> To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
> Subject: New to IP Tables
> Date: Wed, 13 Nov 2002 16:14:33 -0800
> 
> 	I just started using IP Tables and have a question. I was not able
> to find the answer in any of the docs I've read so far.
> I have a machine that I am using as a router and running Ip Tables on it.
> Here is a list of my tables.
> 
> [root@qa-gate root]# iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination         
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http 
> ACCEPT     tcp  --  anywhere             anywhere           tcp
> dpt:ftp-data
> 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:26 
> DROP       tcp  --  anywhere             anywhere           
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> Chain test (0 references)
> target     prot opt source               destination
> 
> I am not able to pass any data through the router. Here is the scenario, I
> want to access a Web Site which is on the other side of the router. The way
> that I interpret this is that the packet will get passed to the first chain
> which is
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http
> and be let through, yet this is not happening. All tcp traffic is being
> blocked which is defined by my 6th rule. I guess I am not understanding
> this, but I would think that the packet would match the first rule and be
> passed through and the following chains would be ignored. My logic is
> probably wrong.
> 
> Thanks,
> David
> 
> 
> 
> 
> 
> --__--__--
> 
> _______________________________________________
> netfilter mailing list
> netfilter@lists.netfilter.org
> https://lists.netfilter.org/mailman/listinfo/netfilter
> 
> 
> End of netfilter Digest
> 





