From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: reset /proc/net/dev
Date: Thu, 12 Sep 2002 12:48:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209121148.g8CBmSv09962@vulcan.rissington.net>
References: <02091217115600.02481@sanitarium>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <02091217115600.02481@sanitarium>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 12 September 2002 12:43 pm, Rohan Almeida wrote:

> HI List,
> How do i reset the values in /proc/net/dev ?
> This file holds values for count of each (packet && byte),
> (sent && received) through all interfaces.
>
> I'm using a monitor which reads values from this
> file and prints out some nicely formatted output.
>
> But i need to reset the values. ie. set then to zero.
> Restarting the network does not do what i want.
> I guess a reboot should do it.
>
> Any other way?

Not that I know of.

Could you perhaps read the values and save them somewhere, then subtract that 
stored value next time you read the interface, to get the difference ?

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

