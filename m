From: "Klemen Kecman" <klemen@sting.si>
Subject: Re: chains in the same table
Date: Thu, 6 May 2004 12:22:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006301c43354$167062b0$6a02a8c0@klemen>
References: <004c01c4334f$3f1329f0$cb0210ac@jz105>
Reply-To: "Klemen Kecman" <klemen@sting.si>
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


----- Original Message -----
From: "Jee J.Z." <jz105@york.ac.uk>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, May 06, 2004 11:48 AM
Subject: chains in the same table


> Hi all,
>
> I'm asking a basic question that in the same table (for example, the
filter table), if a packet hit the INPUT chain while no rules are in the
INPUT chain and the default policy is ACCEPT, will the packet be passed on
to the FORWARD chain? If accepted again, be passed on to the OUTPUT chain?
>
> Thank you,
> Jee

I think .. no, it will just accept it. Packet traverses current rules.
Please correct me if I'm wrong.


