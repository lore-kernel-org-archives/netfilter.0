From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I thought ssh is port #22 ?!!
Date: Thu, 1 Apr 2004 16:28:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404011628.56320.Antony@Soft-Solutions.co.uk>
References: <9908FCB837A50642B74E2BEC198843095CC76C@csrees-exchsrvb.csrees.usda.gov>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9908FCB837A50642B74E2BEC198843095CC76C@csrees-exchsrvb.csrees.usda.gov>
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

On Thursday 01 April 2004 4:14 pm, Martinez, Michael wrote:

> Port 32873 is the return port on the ssh client.
>
> Here's how it works. The server listens on port 22. The client opens a
> connection to the server, and tells the server which return port to use. If
> you do "netstat -an" you will see the server talking on port 22, and the
> client talking on some high numbered port like 32873. The high number port
> used is random. It will change from one session to the next.
>
> This is true not just for ssh - it is true for most tcp applications.

I'd say it's true for all TCP applications, and most UDP applications.

There are some TCP applications (FTP being the most common example) where a 
*second* connection gets opened up on different ports, but that one works in 
exactly the same way as the first - and they each obey the above description.

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


