From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Bandwidth Balance, balance of Load
Date: Sat, 15 Feb 2003 09:58:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302150958.06735.netfilter@newkirk.us>
References: <000c01c2d4e2$01454710$0100a8c0@fede>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000c01c2d4e2$01454710$0100a8c0@fede>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Federico Berardi <fed@argentina.com>, netfilter@lists.netfilter.org

On Saturday 15 February 2003 06:04 am, Federico Berardi wrote:
> I m newbie
> Can i do it with IPTables?
> Iam sharing internet and when someone download a big file, the others
> can=B4t surf Can i do something with IPTables?
> Fede!

Read up at http://lartc.org/howto , the Linux Advanced Routing and=20
Traffic Control HowTo.  What you are looking for, specifically, is=20
called Ingress Policing, but your situation will probably be improved if=20
you study and grok Queuing Disciplines as well as bandwidth management.

j


