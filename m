From: "Paul F. Bernal B. - EasyTeck" <pbernal@easyteck.com>
Subject: Re: NAT question (forwarding with subdomains)
Date: Thu, 13 May 2004 14:24:18 -0500 (ECT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <58539.200.107.22.222.1084476258.squirrel@www.easyteck.com>
References: <20040513172702.17791.51996.Mailman@vishnu.netfilter.org>
    <55621.200.107.22.222.1084470741.squirrel@www.easyteck.com>
    <200405131908.40252.Antony@Soft-Solutions.co.uk>
Reply-To: pbernal@easyteck.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405131908.40252.Antony@Soft-Solutions.co.uk>
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

Thanks for your response you were right that's what I need and your answer
clear! thanks! if I find any solution to this I'll make you know...

"everybody needs to know something more about everything, 'cause nobody
knows at all!"
----------------
don pool


> On Thursday 13 May 2004 6:52 pm, Paul F. Bernal B. - EasyTeck wrote:
>
>> Hi!,
>>
>> I got an internal 192.168.0.0/24 LAN with about 5 web servers including
>> the one which has iptables running and internet output ...
>
> You're running your firewall and a web server on the same machine?
> Ugh...
>
>> What I need to do is:
>>
>> When someone in the Internet asks for http://sub1.mydomain.com/ respons
>> the 192.168.0.3 machine (wich has a web server running port 80)
>>
>> When someone in the Internet asks for http://sub2.mydomain.com/ responds
>> the 192.168.0.4 machine (wich has a web server running port 80)
>
> If DNS resolves sub1.mydomain.com and sub2.mydomain.com as two different
> IP
> addresses, then simple DNAT rules will work here.
>
> If sub1.mydomain.com and sub2.mydomain.com resolve to the same IP address,
> then you cannot do what you want with netfilter (because it works with IP
> addresses and port numbers, not hostnames and domains).
>
> The solution in that case would be Squid or Apache as acceleration proxy
> servers.
>
> Regards,
>
> Antony.
>
> --
> People who use Microsoft software should be certified.
>
>                                                      Please reply to the
> list;
>                                                            please don't CC
> me.
>
>


----------
Paul F. Bernal B., Ing.
Gerente - EasyTeck

