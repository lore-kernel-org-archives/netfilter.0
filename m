From: Bosse Klykken <bosse+netfilter@klykken.com>
Subject: Re: iptables help
Date: Thu, 4 Nov 2004 23:39:07 +0100
Message-ID: <20041104223907.GA25863@klykken.com>
References: <s18a0743.032@dsi.a-star.edu.sg>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <s18a0743.032@dsi.a-star.edu.sg>
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

On Thu, Nov 04, 2004 at 10:40:51AM +0800, Wei Ming Long wrote:
>                    VNC Server 192.168.1.4
>                           |
>                           | --------> ssh tunnel on port 5800
>                           |
>                 eth1= 192.168.1.2
>                           |
>                 Linux Gateway
>                           |
>                  eth0=192.168.33.167
>                           |
>                           |
>                  WindowsXP 192.168.33.164 
>           
> 
> Requirement: To be able to access the VNC Server behind the Linux gateway
> using the web browser on port 5800 tunneled through ssh.

If the 192.168.33.0/24 network has a valid route for the 192.168.1.0/24
network through the Linux gateway, then you could SSH directly to the
VNC server without NAT. On the Windows XP machine you can use plink or
putty to make the port mappings, and point the XP web browser to
localhost.

Be advised that VNC port 5800 has java stuff only, while I believe that
VNC traffic still will transmit on port 5900, so you might need to
create an additional SSH tunnel, if you can't use a vncviewer on the XP
machine and do with a SSH port link on port 5900.

> I created a ssh tunnel between the VNC Server(192.168.1.4) & the Linux
> Gateway(192.168.1.2) for port 5800

OK, you can do this if the networks are not routable with each other.
For troubleshooting I would get a vncviewer on the XP box, instead of
fiddling around with the java stuff. When you can get an ordinary
connection with a vncviewer on port 5900, you can try creating another
SSH tunnel for port 5800, and see if you can access the java client.

On the linux box, you can run this:
ssh -N -L 5800:localhost:5800 192.168.1.4
ssh -N -L 5900:localhost:5900 192.168.1.4

And then go to http://192.168.33.167:5800 from your XP web browser.

> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to
> 192.168.1.2:5800 

I don't really see the need for NAT here.

.../Bosse
-- 
Bosse Klykken - http://www.klykken.com/~bosse
Keep staring. I might do a trick.

