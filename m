From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: not [!] rule is not working
Date: Tue, 14 Aug 2007 09:24:56 -0500
Message-ID: <46C1BB38.5090506@riverviewtech.net>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>	<46C18868.7050306@freemail.hu>
	<d41814cf0708140528o4fe73a93x85a8f7ce53396b03@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d41814cf0708140528o4fe73a93x85a8f7ce53396b03@mail.gmail.com>
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

On 08/14/07 07:28, pankaj jain wrote:
> I tried arptables -A INPUT ! -i eth1 --opcode Request -d 10.19.1.102 
> -j DROP but it was not working.  when i do the "arptables -L -nvx" it 
> shows:
> 
> -j DROP -i eth1 -o !* -d 10.19.1.102 --opcode 1 , pcnt=0 -- bcnt=0

(I'm betting that there is a logic to syntax mapping problem that is
preventing this from working.)

Can you get the rule to work with out any interfaces defined, i.e. get
it to block on all interfaces?  If you can get this to work it should be
trivial to add the correct interface.




Grant. . . .

