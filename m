From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Antwort: Re: Antwort: Re: ipsets for both source and target in 
 one iptables-rule?
Date: Fri, 2 Dec 2005 13:18:00 +0100 (CET)
Message-ID: <49666.193.173.147.3.1133525880.squirrel@webmail.sterenborg.info>
References: <Pine.LNX.4.58.0512020838530.8267@blackhole.kfki.hu>
	<OFAD4EEC06.4666A14A-ONC12570CB.0035DAA4-C12570CB.00404F91@knapp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OFAD4EEC06.4666A14A-ONC12570CB.0035DAA4-C12570CB.00404F91@knapp.com>
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
To: netfilter@lists.netfilter.org

On Fri, December 2, 2005 12:42, Frank.Mayer@knapp-systems.com wrote:

>> The '-s 0/0 -d 0/0' matches buy nothing, they express the default.
>>
> If the "-s 0/0 -d 0/0 .... -j ACCEPT" matches express the default or
> not does depend on the default, don't they?

The default is 0/0 for both.

> Of course, I could do without expressly stating source and
> destination addresses when defining the generic rule, but I don't
> think that's the point you wanted to make, is it?

Since specifying -s 0/0 -d 0/0 is the same as not specifying these
parameters, I think it is the point Jozsef wanted to make.


Gr,
Rob



