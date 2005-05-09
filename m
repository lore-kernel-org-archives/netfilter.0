From: Jason Opperisano <opie@817west.com>
Subject: Re: port and adress forward
Date: Mon, 9 May 2005 14:19:28 -0400
Message-ID: <20050509181928.GA5978@bender.817west.com>
References: <427F7554.4000107@dud.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <427F7554.4000107@dud.com.br>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, May 09, 2005 at 02:36:04PM +0000, Roberto Dud (listas) wrote:
> Hi All,
> 
> I have a web and mail server in my local lan with ip 192.168.0.x and I 
> have a firewall / gateway with valid address.  I have a policy a to 
> redirect port 80 to my internal server. But I try to access my website 
> inside my internal lan and doesn't access.
> 
> My chain is below:
> 
>  iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT 
> --to-dest 192.168.0.X
>  iptables -A FORWARD -p tcp -i eth0 --dport 80 -d 192.168.0.X -j ACCEPT
> 
> Anyone help me?

1) connect to the web server using its 192.168.0.X address--no firewall
involved.

2) setup split dns so that www.mysite.com resolves to 192.168.0.X
internally and the external IP of the firewall externally.

3) wait for someone else to post the stupid DNAT/SNAT solution.

-j

--
"Stewie: Mother, as first lady of the American stage Helen Hayes once
 said, "I'm going to kill you.""
        --Family Guy

