From: Ian Holsman <kryton@gmail.com>
Subject: Bandwidth Shaping requests coming from a web server
Date: Wed, 23 Jun 2004 13:06:12 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2a627cd2040622200675aed3eb@mail.gmail.com>
Reply-To: ian@holsman.net
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

Hi.

I would like to write a apache module which limits the speed we send
out the response based on some internal algorithm (like a cookie, or a
line in the request header, or some random number ;-)).

Ideally I would like a method to tell the kernel 
use queue 'XYZ' for this socket I just opened, and then just use the
normal sendfile/write requests to send it out

Is this possible?

also .. any tips on how to this on a BSD box?

Thanks in advance
Ian Holsman

