From: ads nat <adsnat@yahoo.com>
Subject: RE: Is this at all possible
Date: Thu, 2 Dec 2004 06:52:32 -0800 (PST)
Message-ID: <20041202145232.19949.qmail@web60401.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Alexis <alexis@tpys.com.ar>, 'Steve Comfort' <steve@4Dllc.com>, netfilter@lists.netfilter.org

I am facing similar problem.

I have two Gateways getting Internet bandwidth from
two different sources.

Server no. 1 will disctribute bandwidth by natting to
IP address 192.168.0.2-192.168.0.150 of subnet.
eth0 - xxx.xxx.xxx.xxx
eth1 192.168.0.1

GATEWAY setting for subnet client's will be
192.168.0.1

Server No. 2 will supply bandwidth to same subnet but
it will be with squid proxy server authentication and
DHCL running. In DHCP configuration I will configure
IP's 192.168.0.151-192.168.0.200 
eth0 - xxx.xxx.xxx.xxx
eth1 - 192.168.0.254

GATEWAY setting for these IP client's will
192.168.0.254

I think It should be possible. I don't have
infrastructure to check this in the lab therefore
question.

Thanks for support.


--- Alexis <alexis@tpys.com.ar> wrote:

> Double nat is the solution for this issue.
> 
>
http://www.netfilter.org/documentation/HOWTO//netfilter-double-nat-HOWTO.htm
> l
> 
>  
> 
> > -----Mensaje original-----
> > De: netfilter-bounces@lists.netfilter.org 
> > [mailto:netfilter-bounces@lists.netfilter.org] En
> nombre de 
> > Steve Comfort
> > Enviado el: Jueves, 02 de Diciembre de 2004 9:06
> > Para: netfilter@lists.netfilter.org
> > Asunto: Is this at all possible
> > 
> > Hi all,
> > 
> > I'm 99% sure that the answer to this one is no,
> but a 
> > customer asked :)
> > 
> > They have two buildings with networks running on
> the same 
> > (192.168.2.x) subnet.
> > 
> > Is it possible to configure a (wireless) router
> that would be 
> > capable of routing between these identical
> sub-nets. Somehow, 
> > maybe restricting one half to addresses below 127
> and getting 
> > cunning with the netmask?
> > 
> > Don't ask why they don't want to change to
> different subnets!
> > 
> > A resounding lack of response will be sufficient
> confirmation 
> > for me that this is a silly scenario.
> > 
> > Ciao
> > Steve Comfort
> > 
> > 
> > 
> > 
> 
> 
> 



		
__________________________________ 
Do you Yahoo!? 
Take Yahoo! Mail with you! Get it on your mobile phone. 
http://mobile.yahoo.com/maildemo 

