From: Frederic de Villamil <neuro@seclab.jp>
Subject: Re: Logging
Date: Mon, 15 Mar 2004 17:07:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040315160747.GA96139@jesus.seclab.jp>
References: <1079365863.2163.8.camel@vejan>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1079365863.2163.8.camel@vejan>
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
Content-Transfer-Encoding: 7bit
To: Mario Udina <m.udina@libero.it>
Cc: netfilter@lists.netfilter.org

On Mon, 15 Mar 2004, Mario Udina wrote:

> Hello!
>
> I have done some googling however did not manage to find out if there
> is a way to define a file where iptables writes its logs.
>
> As I read in the man the file where the logs are written is the kernel
> log i.e. /var/log/messages
>
> is there a way to send this output to another file in order to keep the
> logs clean?
>
> regards,

Hi Mario,
maybe what you're looking for is in /etc/syslog.conf.

--
< Ylli> lol je rigole neuro jte prend pa pr un pervers ms un president
et pere de famille respectable :s
http://www.seclab.jp

