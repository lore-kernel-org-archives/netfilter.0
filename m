From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this config OK, plus where should I be logging...
Date: Mon, 5 Apr 2004 14:48:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051448.45733.Antony@Soft-Solutions.co.uk>
References: <000001c41ad1$692d25b0$0464a8c0@stu> <>> <200404051434.04761.Antony@Soft-Solutions.co.uk>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404051434.04761.Antony@Soft-Solutions.co.uk>
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

On Monday 05 April 2004 2:34 pm, Antony Stone wrote in error:

> Most systems below an unreasonable level of complication have rules which
> fall into the following categories:
>
> 1. Clients on local LAN accessing servers on Internet.
> 2. Clients on local LAN accessing servers on DMZ.
> 3. Systems on the Internet accessing servers on DMZ.
> 4. Servers on DMZ accessing the Internet.
> 5. Replies to any/all the above.
>
> For most small systems, (1) is very simple - allow everything.
> (2) and (4) (for a simple setup) provide the same services, so combined
> rules can be used without bothering about the input interface.
> (3) is the area where your level of paranoia determines how complex your
> rules get.
> (5) is a single rule on the whole firewall allowing Established / Related
> packets.

I got 3 and 4 mixed up there, of course...

It should read "(2) and (3) (for a simple setup) provide the same services, so 
combined rules can be used without bothering about the input interface.
(4) is the area where your level of paranoia determines how complex your rules 
get."

Regards,

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


