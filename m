From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP firewalling on today's internet
Date: Sun, 4 Jul 2004 14:07:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407041407.23280.Antony@Soft-Solutions.co.uk>
References: <2E314DE03538984BA5634F12115B3A4E62E806@email1.mitretek.org> <200406301557.58665.Antony@Soft-Solutions.co.uk> <cc42u4$7bi$1@sea.gmane.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <cc42u4$7bi$1@sea.gmane.org>
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

On Friday 02 July 2004 5:36 pm, Jason Lunz wrote:

> Antony@Soft-Solutions.co.uk said:
> > You should certainly allow ICMP through if you want traceroute to work,
> > and you should generally allow ICMP if you want many other things to
> > work.   If you want to block certain types of ICMP, that's fine (many
> > people do), but don't block all ICMP.
>
> Speaking of which, what's the consensus on appropriate ICMP filtering?

Personally I'm happy with anything which gets classified as RELATED by 
netfilter.   I allow ESTABLISHED,RELATED packets in & out of my firewall, and 
I specify particular TCP & UDP ports (and a bit of ESP) which I want to allow 
through as well - I don't use any ICMP-specific rules.

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the list;
                                                           please don't CC me.


