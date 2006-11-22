From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Someone is using too much bandwidth???
Date: Wed, 22 Nov 2006 09:15:25 -0600
Message-ID: <4564698D.8050906@riverviewtech.net>
References: <380-220061132255717968@zamnet.zm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <380-220061132255717968@zamnet.zm>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

lubasi wrote:
> Okey thanks for tcpdump.

No problem.

> But got a problem. I cant seem to really figure out what those lines
> mean? say these four (4) lines:
> 
> 08:01:42.131982 IP 192.168.0.71.1054 > mail.parliament.gov.zm.squid:
> . ack 6755 win 65535

Host 192.168.0.71 is talking from port 1054 to host mail.parliament.gov.zm's 
Squid port (3128) (acknowledging packet 6755 with a window size of 65535)

> 08:01:42.225114 IP 213.155.151.150.http > 192.168.0.183.3011: P
> 1:334(333) ack 170 win 5840

213.155.151.150 was sending traffic from the http port (80) back to 
192.168.0.183

> 08:01:42.229863 IP 192.168.0.183.3011 > 213.155.151.150.http: F
> 170:170(0) ack 334 win 63907
> 08:01:42.229968 IP 213.155.151.150.http > 192.168.0.183.3011: F
> 334:334(0) ack 171 win 5840

> Okey seen the date part, the IP address then looks like the port on
> which the connection is listening on is appended to the requesting IP
> address then the greater than???? confused from that point.

The greater than is an arrow pointing the direction of the traffic flow. 
There is also some packet information that is not really important for the 
basic traffic flow that you are after.  Consider perusing the TCPDump man 
page.  ;)  You will find out all sorts of things about how you can customize 
the default output of TCPDump.

> Anything i can use to graph this information????

Now you are just being picky.  ;)

I'm sure there are some ways that you could capture this output and run it 
through a graph generation program.  However these are just pieces in a 
total solution.  You may want to look at some of the other things mentioned 
in this thread as I bet they will come closer to doing what you want to do 
out of the box.  If not, look for something that will take the output of 
TCPDump and munge it and then create a file that holds your stats (csv?) and 
then look to have something graph that (GNUPlot?) for you.




Grant. . . .

