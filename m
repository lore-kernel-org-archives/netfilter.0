From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: fake ping reply
Date: Thu, 04 Sep 2003 15:32:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F57935E.9060305@chrisbrenton.org>
References: <20030902165026.2edc8dfd.i.kuten@sam-solutions.net> <20030904162444.GB31513@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: "I.S.Kuten" <i.kuten@sam-solutions.net>, netfilter@lists.netfilter.org

Ramin Dousti wrote:
> On Tue, Sep 02, 2003 at 04:50:26PM +0300, I.S.Kuten wrote:
>>
>>i wanted to setup iptables , when someone pings my box , echo-reply
>>would come from other machine then mine .
> 
> A very strange question. When the client sends you a echo-request, it
> expects to receive echo-reply from the same IP address. If some other
> IP address sends the echo-reply, it will simply get dropped by the OS
> on the client, as there is no match for this bogus packet...

I don't think that's where he's going with this. This used to be a very 
cool feature that was remove about 2 years ago. :(  :(  :(

Here's the concept, let's say you've been allocated a class C legal 
address space and have 10 or so IP address that are not in use. What I 
used to do was reject echo-request packets going to those address with 
echo-replies, and reject all other echo-requests with an host-unreachable.

Now, "annoying script kiddie that could not hack their way out of a 
paper bad" comes along and ping sweeps your network. Only those 10 IP 
addresses respond, so they start attacking them.

Now, one of the things you need to do when reading your logs is filter 
out the script kiddies from the people you really need to worry about. 
Obviously someone who persists in attacking non-existent systems and 
can't tell the difference can be stopped with a simple ban rule.

Also, increasing the number of packets that an attacker throw at your 
network also increases your chances of identifying them. Again, this 
rule was a good fit for that as well.

I have to say I'm a major iptables bigot. I've contributed to the 
project and talk it up big time in the SANS perimeter training. __The 
only thing__ that has ever really bummed me about about the project was 
the removal of the echo-reply reject option.

</dismounting soap box>

;-)
C


