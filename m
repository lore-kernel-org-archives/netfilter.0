From: Alexis <alexis@attla.net.ar>
Subject: Re: Instructions on how to redirect port 80 to port 8080
Date: Tue, 17 Feb 2004 16:04:53 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077044692.2402.51.camel@pepelui.baicom>
References: <9908FCB837A50642B74E2BEC198843095CC64A@csrees-exchsrvb.csrees.usda.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9908FCB837A50642B74E2BEC198843095CC64A@csrees-exchsrvb.csrees.usda.gov>
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
To: "Martinez, Michael" <MMARTINEZ@CSREES.USDA.GOV>
Cc: Netfilter <netfilter@lists.netfilter.org>

iptables -t mangle -A PREROUTING -p tcp --dport 80 -j DNAT --to
x.x.x.x:8080

could be a start :)



On Tue, 2004-02-17 at 15:55, Martinez, Michael wrote:
> Guys - 
> 
> I'm finding a lack of documentation describing how to do this. It ought
> to be simple. I know how to do it with ipchains.
> 
> On a redhat linux system using /etc/sysconfig/iptables, what line(s) do
> I add to /etc/sysconfig/iptables to configure to redirect all inbound
> port 80 traffic to port 8080 on the same host?
> 
> Thank  you -
> 
> Regards,
>  
> Michael Martinez
> ISTM/CSREES
> United States Department of Agriculture
> ---
> This email is signed with my digital signature so that you may verify
> the authenticity of the sender.
-- 
Alexis <alexis@attla.net.ar>


