From: "Fernando R. Durso" <fernando@intrace.com.br>
Subject: Re: Firewall L7
Date: Mon, 14 May 2007 15:13:39 -0300
Message-ID: <4648A6D3.4090307@intrace.com.br>
References: <3da957060704180538m12ec86edr2536867007a8d05@mail.gmail.com>	<462612C7.3090504@solutti.com.br>	<3da957060704191115v62303fdh838beab7328ed331@mail.gmail.com>	<6bb85d880704191258r4b3638adye6669cee42b16485@mail.gmail.com>	<3da957060705111053o72da3957q7887879d7e9cc87d@mail.gmail.com>	<4644CC76.80502@zensoluciones.com>
	<3da957060705141017x700eee6bq7c1781f0b4756c39@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3da957060705141017x700eee6bq7c1781f0b4756c39@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stephan Higuti <higuti.sam@gmail.com>, netfilter@lists.netfilter.org

give an ls /lib/iptables/ or /usr/lib/iptables or wherever your iptables 
libs are and look for
 libipt_layer7.so if you don't find it it's because your kernel and/or 
iptables compilation has failed.... by the way you can remove the "-t 
filter"



Stephan Higuti escreveu:
> Thankz guys!
>
> My block rules isn't works!
> I'm using this rules to block msn protocol...
>
>
> iptables -t filter -A FORWARD -m layer7 --l7proto msnmessenger -j DROP
>
>
> Any idea?
>
> Best Regards
>
> Stephan
>
> -
> ---------------------------------------------------------------------
> Stephan Higuti
> MSN: higutisam@hotmail.com
> Email: higuti.sam@gmail.com
> ---------------------------------------------------------------------
>


