From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Using External NATTED addresses Inside the Firewall
Date: Tue, 18 May 2004 20:49:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405182049.29795.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.2.20040518151903.03c3ee30@mail.naccrra.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.2.20040518151903.03c3ee30@mail.naccrra.org>
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

On Tuesday 18 May 2004 8:29 pm, David O'Brien wrote:

> What I need to happen is when a user on an Internal 192.168.123.x address
> tries to pull up a web page or check mail or anything off of one of the
> three 1:1 NAT'd boxes they can by using the real x.x.x.250 , .199 , or .160
> addresses and or the boxes hostname. Another DNS server for just
> internal use isn't possible right now. I need an iptable rule (probably
> OUTPUT)  that redirects the x.x.x.whatever address back to the internal
> address is it's one of the three and if it's coming from the inside.

http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

Regards,

Antony.

-- 
The lottery is a tax for people who can't do maths.

                                                     Please reply to the list;
                                                           please don't CC me.


