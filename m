From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: RE: I thought ssh is port #22 ?!!
Date: Thu, 1 Apr 2004 21:22:42 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1B98i2-000R7B-7m@alf1.lmb.internal>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


>> > Here's how it works. The server listens on port 22. The client opens a
>> > connection to the server, and tells the server which return port to use.
>> > If you do "netstat -an" you will see the server talking on port 22, and
>> > the client talking on some high numbered port like 32873. The high
>> > number port used is random. It will change from one session to the next.
>> >
>> > This is true not just for ssh - it is true for most tcp applications.
>
>> Unfortunately I have the "privilage" of maintaining a customer TCP
>> protocol which cans you if your source and destination ports aren't as
>> specified by their fcked up protocol!!
>
>Nevertheless, that's how TCP works, for every customer in the Universe.
>Sack your customer, and get another?.


Hmmm. I thought it went like this:

The client application requests a random high port
on the client machine (a socket). Then, using this
socket it makes a request to the required well-known
port (e.g. 22 for ssh) on the server machine.
Since no other application on the client box will ever
be given the same high-numbered port as any other
application on that box, the client-ipaddr/highPort + 
server-ipaddr/wellKnownPort combination defines a unique
'circuit' over which further communication takes place.
The client doesnt have to do special things to tell the
server what its connecting port-number is.
Until along comes ftp, which has a command channel and
a data channel. So having made a connection in the
above way for the command channel, the client and server
have to make further negotiations for a data channel.
And firewalls have to be aware of this.

Thats my two penn'orth

Cheers,
Terry.

