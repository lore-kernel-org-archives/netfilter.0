From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Adding a flag to a packet
Date: Tue, 30 Mar 2004 22:40:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403302240.29413.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net> <200403302223.33019.Antony@Soft-Solutions.co.uk> <20040330172840.491b9b4a@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040330172840.491b9b4a@darna.vectec.net>
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

On Tuesday 30 March 2004 10:28 pm, Cody Harris wrote:

> On Tue, 30 Mar 2004 22:23:33 +0100, Antony Stone wrote:
> >
> > There are other ways to do what you want, and the IP tunnel solution is
> > not at all complicated (however it is not at all secure, either - packets
> > are transferred across the Internet between the two networks with no
> > encryption or other attempt to hide the contents).
>
> Would the VPN also transmit the lan-based packets (such as the ones needed
> to run games).

A VPN will route anything - just like a standard router - except that the 
traffic is hidden (encrypted) as it passes across the Internet.   Basically, 
if you imagine having a router with two interfaces, one connected to network 
A and the other connected to network B, except the networks are a few 
thousand miles apart, that's what a VPN does for you.

Regards,

Antony.

-- 
One good tern deserves another.

                                                     Please reply to the list;
                                                           please don't CC me.


