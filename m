From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: Is this at all possible
Date: Thu, 2 Dec 2004 10:06:24 -0300
Message-ID: <E1CZqgw-0005FY-00@deer.gmane.org>
References: <41AF0514.4030503@4Dllc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41AF0514.4030503@4Dllc.com>
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
To: 'Steve Comfort' <steve@4Dllc.com>, netfilter@lists.netfilter.org

Double nat is the solution for this issue.

http://www.netfilter.org/documentation/HOWTO//netfilter-double-nat-HOWTO.htm
l

 

> -----Mensaje original-----
> De: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] En nombre de 
> Steve Comfort
> Enviado el: Jueves, 02 de Diciembre de 2004 9:06
> Para: netfilter@lists.netfilter.org
> Asunto: Is this at all possible
> 
> Hi all,
> 
> I'm 99% sure that the answer to this one is no, but a 
> customer asked :)
> 
> They have two buildings with networks running on the same 
> (192.168.2.x) subnet.
> 
> Is it possible to configure a (wireless) router that would be 
> capable of routing between these identical sub-nets. Somehow, 
> maybe restricting one half to addresses below 127 and getting 
> cunning with the netmask?
> 
> Don't ask why they don't want to change to different subnets!
> 
> A resounding lack of response will be sufficient confirmation 
> for me that this is a silly scenario.
> 
> Ciao
> Steve Comfort
> 
> 
> 
> 


