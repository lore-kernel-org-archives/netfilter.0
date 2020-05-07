From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: [Help] Allow website using iptables
Date: Thu, 07 May 2020 11:40:22 +1000
Message-ID: <87pnbged4p.fsf@goll.lan>
References: <CAByCkvqDvxqzkCvt+J9tJatSk3K-TW2gAENojtnG7PvWKqO0YA@mail.gmail.com>
        <968b51ba-41c2-518f-6019-9912fb408f68@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Sơn Đỗ, I agree with Alessandro.  Here are some additional comments.

Alessandro Vesely <vesely@tana.it> writes:
> On 04/05/2020 08:53, Sơn Đỗ wrote:
>> I have a Linux router and using iptables 1.4 to configure the firewall.

Note that iptables 1.4 is *really* old - about 2015 I think.
Consider upgrading if possible.

>> And I want to permit a device to access a certain website with a
>> domain name and block other websites. So I have use some cmds in
>> iptables below:
>> 
>> iptables -N allow_chain
>> iptables -A FORWARD -j allow_chain
>> iptables -A allow_chain -m mac --mac-source 11:22:33:44:55:66 -m string --algo bm --string youtube -j ACCEPT
>> iptables -A allow_chain -m mac --mac-source 11:22:33:44:55:66 -j DROP
>> 
>> In this case, I want computer with MAC address 11:22:33:44:55:66
>> connected to my Linux router can only access the youtube.
>
> Quite problematic, as it has to be able to access a name server to get the
> target IP, at least.  If you mean youtube.com, access to a number of ancillary
> Javascript providers (google.com, gstatic.com, and the like) may also have to
> be granted.

See also https://en.wikipedia.org/wiki/Deep_packet_inspection

> For a different approach, censorship is often applied by controlling the DNS resolver.  See:
> https://en.wikipedia.org/wiki/Internet_censorship#Content_suppression_methods

Another approach is to disable routing (ip_forward) altogether, and
instead require clients to use a forward proxy (e.g. squid).

The proxy can then choose what sites to allow.
HTTPS proxies using CONNECT, so per-domain ACLs are easy.
To e.g. allow https://example.com/index.html but block https://example.com/email.php,
you need the proxy to do a MITM attack on your users, see

    http://www.squid-cache.org/Doc/config/ssl_bump/

Note that your jurisdiction's privacy laws may forbid such techniques.

Both DNS and HTTP proxy methods are increasingly difficult to implement
as GUI web browsers get smarter about e.g. cert pinning and DNSSEC/DANE.
See e.g.

    https://en.wikipedia.org/wiki/Certificate_Transparency

