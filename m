From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: how to write different ip sources on a single rule
Date: Thu, 28 Sep 2006 13:42:34 +0200 (CEST)
Message-ID: <51300.193.173.147.3.1159443754.squirrel@webmail.sterenborg.info>
References: <OFA056E856.525622F6-ONC22571F7.003EC45C-C22571F7.003FED20@gunessigorta.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OFA056E856.525622F6-ONC22571F7.003EC45C-C22571F7.003FED20@gunessigort
	a.com.tr>
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

On Thu, September 28, 2006 13:35, Burak Ozgoren wrote:
> Hi,
>
>
> I know i can write source ip within a ip range or with a network mask. =
For
> example: 192.168.0.5-192.168.0.15 or 192.168.0.0/24
>
>
> Can i write it for single ip. Like 192.168.0.5 and 192.168.0.9

You can use the second notation (192.168.0.0/24), but for the first you n=
eed
the iprange match.

http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-ip=
range



Grts,
Rob



