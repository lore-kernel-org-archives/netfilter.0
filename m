From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bootp problems
Date: Wed, 7 Apr 2004 01:00:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404070059.47835.Antony@Soft-Solutions.co.uk>
References: <20040406141159.752.qmail@web13121.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040406141159.752.qmail@web13121.mail.yahoo.com>
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

On Tuesday 06 April 2004 3:11 pm, Jo wrote:

> hi,
>
> i have the following problem
>
> [DialIn]2.2.2.2----2.2.2.1[FW]1.1.1.1---1.1.1.2[DHCP]
>
> the DialIn tries to get an IP from the DHCP Server.

You need a DHCP relay on the 2 network to do this.

DHCP requests do not cross routers (they are ethernet broadcasts).

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


