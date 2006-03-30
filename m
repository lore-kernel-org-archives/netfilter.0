From: "Carlos Pastorino" <carlos.pastorino@gmail.com>
Subject: Re: Real ip's behind Firewall
Date: Thu, 30 Mar 2006 11:14:54 -0300
Message-ID: <cc4fcc140603300614o250d5faw6149bd5b15ec89f2@mail.gmail.com>
References: <3da957060603300530o74205fe9g2067b6c61152da5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3da957060603300530o74205fe9g2067b6c61152da5@mail.gmail.com>
Content-Disposition: inline
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
To: Stephan Higuti <higuti.sam@gmail.com>
Cc: netfilter@lists.netfilter.org

Yes you can. You have to create subnets with the IP range you have.
One subnet shall be used for the interface connected to the Internet,
and the other subnet shall be used for the interface connected to the
internal network.

After that, you have to create routes on your Internet router, so it
knows were to send the packets destined to the internal network.


On 3/30/06, Stephan Higuti <higuti.sam@gmail.com> wrote:
> Hello guys.
> Let me explain my situation:
> I have a Internet Connection coming in a switch , In this switch , i
> have my "Firewall" and some other serevrs that uses Real Ip's, so ,
> the firewall dont protect the other servers , cause the servers dont
> are behind it.
> I need to change this , making a Real Firewall , in the front of the serv=
ers.
> I want to know:
> Can i put some servers using real ip's behind my firewall using iptables?
> If yes, how can i make this?
>
> Sorry for my bad english!
>
> Thank'z
>
> Cheers
>
> Stephan
>
>

