From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: incoming interface confusion question
Date: Tue, 22 Jun 2004 08:37:22 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406220836150.2508-100000@blackhole.kfki.hu>
References: <40D736F6.50405@smxy.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D736F6.50405@smxy.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Shaun T. Erickson" <ste@smxy.org>
Cc: netfilter@lists.netfilter.org

On Mon, 21 Jun 2004, Shaun T. Erickson wrote:

> Shaun T. Erickson wrote:
>
> > Are there any cases where iptables can be confused about what interface
> > a packet came in on? Can a packet arriving on interface A ever be
> > reported as arriving on interface B?
> >
> > I had an incident this weekend, and am trying to be certain that the
> > packets came in the interface my system said it did. It's a Red Hat 9
> > system, running their stock 2.4.20-8 kernel.
>
> Please, can anyone answer this for me? I'm trying to prove or disprove a
> theory that would explain an apparent intrusion incident over the
> weekend. It's very important that I know the definitive answer to this.

It can't happen. I'd investigate further assuming IP address forgery.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


