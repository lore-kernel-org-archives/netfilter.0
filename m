From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: not [!] rule is not working
Date: Fri, 17 Aug 2007 08:54:53 -0500
Message-ID: <46C5A8AD.7030003@riverviewtech.net>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>	<46C1BE08.6070409@riverviewtech.net>	<d41814cf0708152256w2e5e146cs7306e9e40e3b6872@mail.gmail.com>	<46C46195.9070500@riverviewtech.net>	<46C4683B.3090702@plouf.fr.eu.org>
	<46C46CE4.70308@riverviewtech.net>
	<d41814cf0708170109xb6f83d2w45ef54adeab1ab75@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d41814cf0708170109xb6f83d2w45ef54adeab1ab75@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/17/07 03:09, pankaj jain wrote:
> do these rules apply for logical interfaces also?

Logical as in aliased interfaces or logical as in VLAN interfaces?  I
don't _think_ they apply to aliased interfaces other than the fact that
the IP(s) will be different.  VLANs will need their own rules though as
they are a pseudo physical interface.

> because in my actual case I would be having 127.x.x.x ips on my 
> physical interfaces and actual ips on logical interfaces. for 
> example:
> 
> eth0 - 127.2.3.4
> eth0:0 - 10.19.0.102

Um, be careful using 127.x.y.z/8 on any thing other than the loop back
as I think there are hard coded filters in the kernel to protect the
loop back.  I don't know if it is to protect the IP range or the subnet
that is assigned to the loop back interface.  Just be aware....

> is there any command which can turn on these flags permanently such
> that I dont have to do it on every reboot of the machine?

Um, there are some config files on some distros that have this option
per say.  Rather that is to say that they read the file and set the
parameters on boot on your behalf.  As far as how to set them and not
have them be set on boot, I'm sure you could modify the kernel source.



Grant. . . .

