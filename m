From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Protecting multiple webservers
Date: Wed, 12 Jan 2005 10:37:56 -0500 (EST)
Message-ID: <36015.142.169.215.10.1105544276.squirrel@142.169.215.10>
References: <15069645.1105491740310.JavaMail.rct@kale>
	<200501120401.01332.bob@zooid.com>
	<399701c4f8b9$7031da10$b000a8c0@cybergeneration.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <399701c4f8b9$7031da10$b000a8c0@cybergeneration.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Maxime Ducharme <mducharme@cybergeneration.com>
Cc: netfilter@lists.netfilter.org

On Wed, January 12, 2005 10:14 am, Maxime Ducharme said:
> Hello

Hi Maxime !

> I do not think you can automagically forward packets,
> DNAT module allows multiple hosts in to --to-destination
> parameter, but hosts will be used at random

Indeed. However, I guess NETMAP target could do the trick.

http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-NETMAP

> Have a nice day

Same for you!

>
> Maxime Ducharme
> Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

Samuel


