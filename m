From: Unknown <unknown@unknown.invalid>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Fri, 9 Jan 2004 09:50:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34314.5191124224$1073660059@news.gmane.org>
References: <08934AF8-4258-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <08934AF8-4258-11D8-AFEE-000393677A36@porchlight.ca>
Content-Disposition: inline
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
To: Peter Schobel <pschobel@porchlight.ca>, netfilter@lists.netfilter.org

On January 8, 2004 10:58 pm, Peter Schobel wrote:
> On Thursday, January 8, 2004, at 09:33  PM, Alistair Tonner wrote:
> > what do you get for modprobe --version and ld -v ?
> > 	I suspect your modutils is incorrect for 2.6.0
>
> modprobe --version
> module-init-tools version 0.9.12
>
> ld -v
> GNU ld version 2.13.90.0.18 20030206

	Okay .. those are both good -- 

	is the error you are getting
	"WARNING : dont include kernel headers in userspace"
	?
	
	Alistair
>
>
> *****************************
> Peter Schobel
> Network Administrator
> Porchlight.ca
> Unlimited Internet
> *****************************
> In a world without walls or fences
> We will have no need for gates or windows
> *****************************

