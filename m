From: Maxim Britov <maxim.britov@gmail.com>
Subject: Re: string seems doesn t work
Date: Fri, 28 Jul 2006 17:57:05 +0300
Message-ID: <20060728175705.529ed584@maxim.office.modum.by>
References: <20060727173432.3cea1a6f@maxim.office.modum.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060727173432.3cea1a6f@maxim.office.modum.by>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 27 Jul 2006 17:34:32 +0300
 Maxim Britov wrote:

> I trying to use string. iptables 1.3.5 / kernel 2.6.18-rc2-ck1
> 
> iptables -A INPUT -p tcp -m string --algo kmp --string 112233 -j LOG
> iptables -A INPUT -p tcp -m string --algo kmp --string ! 112233 -j LOG
> iptables -A INPUT -p tcp -m string --algo kmp --hex-string 112233 -j LOG
> 
> I got worked first rule only.
> 
> Second rule never matches any packets. IMHO it should match any packet without my string. I'm right?
> 
> Thirst rule iptables-save show as:
> -A INPUT -p tcp -m string --string "112233" --algo kmp --to 65535 -j LOG
> I think it transform my --hex-string into --string here. May I misunderstood some here?

And "--algo bm --string 112233" doesn't want match 112233, but match x112233

Is it bug or it is bm algorithm feature?

PS. Happy SysAdmin Day!!! ;)


-- 
Maxim Britov

GnuPG KeyID 0x4580A6D66F3DB1FB xmpp:maxim@modum.by icq 198171258
Fingerprint: 4059 B5C5 8985 5A47 8F5A 8623 4580 A6D6 6F3D B1FB
GnuPG-ru Team (http://lists.gnupg.org/mailman/listinfo/gnupg-ru
               xmpp:gnupg-ru@conference.jabber.ru)

