From: Christian Cernuschi <christian@cernuschi.com>
Subject: Re: redirection
Date: Wed, 9 Apr 2003 15:34:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304091534.46363.christian@cernuschi.com>
References: <7497DCA1C240C042B28F6657ADFD8E09250995@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E09250995@i2km11-ukbr.domain1.systemhost.net>
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
To: dhiraj.2.bhuyan@bt.com, netfilter@lists.netfilter.org

On Wednesday 09 April 2003 03:10 pm, dhiraj.2.bhuyan@bt.com wrote:
> note one thing -
>
> when the client tries to connect to port 80 of x.y.z.1, the firewall in
> x.y.z.1 redirects the traffic to x.y.z.2:80
>
> so the client will be receiving packets from x.y.z.2:80 - which is not =
what
> it is expecting. It is waiting for packets from x.y.z.1:80 - so it will=
 no
> doubt timeout. You should be able to see the packets coming from x.y.z.=
2:80
> by running a sniffer on the client machine.
>
> I think Eric Joe did infact give the right solution - that x.y.z.1 will=
 be
> working as a proxy between the client and x.y.z.2 - although you can
> question if you are achieving your "loadbalancing" by this.
>

exactly...
it's the same conclusion i arrived..

The solution (also for source adress keeping) is to masquerade the destin=
ation=20
machine under the first one!

The destination machine must not reside "under" the first.It can also be =
at=20
the same level (read attached to the same switch) but needs to have the f=
irst=20
machine as gateway. (so MASQ rules works)

Doing in this way should work everything!!
Thank you again (i liked to study this...)
xchris


=09=09=09=09=09=09

