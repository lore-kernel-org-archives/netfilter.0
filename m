From: Pedro Salazar <pedro-b-salazar@ptinovacao.pt>
Subject: RE: load-balancing with netfilter: round robin or what??
Date: 07 Oct 2003 10:58:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065520700.18401.29.camel@vitoria.intra.cet.pt>
References: <2967754783C6E34C94243EAC0D161368BB0393@med-ex1.bham.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2967754783C6E34C94243EAC0D161368BB0393@med-ex1.bham.ac.uk>
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
To: "Khan, Arshad" <a.m.khan@bham.ac.uk>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-10-07 at 10:41, Khan, Arshad wrote:
> how does this compare with the Linux Virtual Server project?
> 
> Arshad
> 

I'm not an expert of Linux Virtual Server (on contrary, my experience
with LVS is too limited to readings), but I know that LVS could do the
same thing -- and in a more powerful way, what netfilter does by itself.

In another words, LVS may also uses the netfilter technology below and
more. For instance, there is a section in LVS docs about LVS-NAT
(section 13). The great thing of LVS is that I will have a solution with
high-availability on the layer of service which is higher than NAT (only
routing) or VRRP (only check IP).

Pedro Salazar.
-- 
PS
pedro-b-salazar@ptinovacao.pt
PGP:0E129E31D803BC61


