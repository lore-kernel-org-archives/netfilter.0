From: "Maciej Soltysiak" <solt@dns.toxicfilms.tv>
Subject: Re: mangle + TCP Flags
Date: Thu, 11 Dec 2003 21:43:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004401c3c027$721e1ee0$0e25fe0a@southpark.ae.poznan.pl>
References: <7A3B4AA360FDEF448F3390421FC8D731012C61E7@coxhpexg.coxhp.com>
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
To: netfilter@lists.netfilter.org

> Now that is a truly interesting question, if a bit off-topic.  What is the
best way to handle recon?
Recon is about getting info.
- If you do nothing, the scanning person gets: X amount of information
- If you use PSD, the scanning person might get weird results, and might get
uninterested, unless
he or she is determined to gather information about you. But noticing PSD
effects (if the person
is smart enough) may cause him to stop, because if someone is using PSD, he
surely is logging it.
And these logs are very easy to understand and to find.

- If you are tarpitting, the scanning person may be able to detect tarpitted
ports. In this case
the person gets X amount of information, as you would have done nothing.

My point is, that no matter what a scanning person does, my services that
are supposed to be
available to the world, and to him also, are supposed to be secure. At this
point we are talking
about application security. Like they say: Firewall is not magic. It just
decides who can see what
and when.

Network security is about actually differentiating between who can scan
what.
If someone is determined, he will finally get the ports you have open, no
matter what.

Regards,
Maciej


