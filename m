From: Roberto Jung Drebes <drebes@inf.ufrgs.br>
Subject: Finding PF inside a netfilter hook
Date: Wed, 8 Jun 2005 17:26:52 -0300
Message-ID: <378475DC-AD3E-4111-932B-7B2700569360@inf.ufrgs.br>
Mime-Version: 1.0 (Apple Message framework v730)
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org


Hi there,

I have a netfilter hook function which is registered at different  
hooks. No problem, I can get which hook called the function through  
the 'hook' parameter. Unfortunately, this function is being  
registered to multiple protocol families (ipv4 and ipv6), and so the  
function cannot really find which hook called it since the defines to  
the ipv4 and ipv6 use the same values.

Is there a simple way to check which protocol family a hook function  
is registered to? Maybe using the 'in' and 'out' parameters?

TIA,

-- 
Roberto Jung Drebes <drebes@inf.ufrgs.br>
Porto Alegre, RS - Brasil
http://www.inf.ufrgs.br/~drebes/



