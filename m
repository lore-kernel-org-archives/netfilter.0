From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: Help need :) How to delete all rules in chain ?
Date: Tue, 28 Sep 2004 16:28:07 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1CCNtY-0005MK-00@deer.gmane.org>
References: <1096399581.1940.0.camel@alucard.kanux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096399581.1940.0.camel@alucard.kanux.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Juan Hernandez' <alucard@kanux.com>, netfilter@lists.netfilter.org

It will delete all rules in a chain!!!
 

> -----Mensaje original-----
> De: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] En nombre de 
> Juan Hernandez
> Enviado el: Martes, 28 de Septiembre de 2004 16:26
> Para: netfilter@lists.netfilter.org
> Asunto: Re: Help need :) How to delete all rules in chain ?
> 
> iptables -F
> On Tue, 2004-09-28 at 15:48, Abylai Ospan wrote:
> > Hello, all !
> > 
> > May be this question in FAQ but I can't find it ;-( I have 
> 3 (or more)
> > identical rules in one (for example - INPUT) chain.
> > If I do command:
> > iptables -D FORWARD -s 10.0.0.10 -d 10.0.0.20 -j ACCEPT 
> > 
> > the first rule is deleted only. Is there any command line option to
> > remove all identical rules in one chain ?
> > 
> > wbr, Abylai
> > 
> -- 
> 
> Juan Hernandez, RHCE SCSA
> .knxTech C.A.
> CC Los Chaguaramos, Ofc 16-10B      |  Tel: (58) 212-6624745
> Los Chaguaramos, Caracas-Venezuela  |  Mobile: (58) 412-5821882
> 
> Programmin' Python is like sugar... Sweet ;)
> 
> 
> 


