From: Arvanitis Kostas <arvanit@ellemedia.com>
Subject: Re: Newbie question
Date: Fri, 10 Oct 2003 17:43:34 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310101743.34884.arvanit@ellemedia.com>
References: <385FE68A-FB2E-11D7-B96A-000393B2CBCE@apple.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <385FE68A-FB2E-11D7-B96A-000393B2CBCE@apple.com>
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
To: netfilter@lists.netfilter.org

On Friday 10 October 2003 17:29, Fabio Ribeiro wrote:
> Dear All,
>
> 	What does mean this kind of error "No Such Object available on this
> agent"
> 	Using "snmptranslate -IR memBuffer" I got a the right answer ie:
> .1.3.6.1.4.1.2021.4.14
>
> 	Sample:
> 	$ snmpget -c localhost -v 2c 127.0.0.1 .1.3.6.1.4.1.2021.4.14
> 	$ enterprises.ucdavis.memory.memBuffer = No Such Object available on
> this agent
>
> 	In fact I'm not being able to get informations on
> .1.3.6.1.4.1.2021.4.x (ie: memory)
>

This means you have not enabled the appropriate MIB module in the agent 
before compiling the agent. Running
# ./configure --help
from the top level directory in the agent's source code distribution 
will show you how to include specific modules, as well as which modules 
are available, and a lot of other possible options.

To the list: Isn't there a FAQ about this? There should be one, listing 
the modules included in the agent as compiled by default.

-- 
A: No. See http://www.netmeister.org/news/learn2quote.html
Q: Should I include quotations after my reply ?


