From: Bill Chappell <chappell@borg.com>
Subject: Re: -m limit --limt 1/s from "Bryan Schmidt" <absolut_bryan@hotmail.com>
Date: Thu, 24 Jul 2003 22:09:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F209150.BA8D9CFB@borg.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------D38CD0F57E0C742C76BFC822"
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
To: netfilter@lists.netfilter.org


--------------D38CD0F57E0C742C76BFC822
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

To all,

My first day on the list - am trying to hook onto his thread.


Bryan,

I had no problem creating chain TEST and running your
iptables command as in your email.  The rule appeared
in the chain as I expected it to look.

I wonder if the error message you get is simply because
iptables does syntax error checking whether the module
is loaded or not.

You say you have ipt_limit module loaded.
?? - as an individual module so that modprobe can test for it
        or built into the kernel?

if you think you have it loaded as an individual module and you
do not, modprobe will report that it "Can't locate module ipt_limit".

We have iptables built into the kernel, so I know what the error
message looks like from some code that has to protect itself on
other builds where that is not true.


Hope this helps.


--
William Chappell,     Software Engineer,     Critical Technologies, Inc.
Suite 400 Technology Center, 4th Floor 1001 Broad Street, Utica, NY 13501
315-793-0248  x148  < bill.chappell@critical.com >  www.critical.com



--------------D38CD0F57E0C742C76BFC822
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
To all,
<p>My first day on the list - am trying to hook onto his thread.
<br>&nbsp;
<p>Bryan,
<p>I had no problem creating chain TEST and running your
<br>iptables command as in your email.&nbsp; The rule appeared
<br>in the chain as I expected it to look.
<p>I wonder if the error message you get is simply because
<br>iptables does syntax error checking whether the module
<br>is loaded or not.
<p>You say you have ipt_limit module loaded.
<br>?? - as an individual module so that modprobe can test for it
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or built into the kernel?
<p>if you think you have it loaded as an individual module and you
<br>do not, modprobe will report that it "Can't locate module ipt_limit".
<p>We have iptables built into the kernel, so I know what the error
<br>message looks like from some code that has to protect itself on
<br>other builds where that is not true.
<br>&nbsp;
<p>Hope this helps.
<br>&nbsp;
<pre>--&nbsp;
William Chappell,&nbsp;&nbsp;&nbsp;&nbsp; Software Engineer,&nbsp;&nbsp;&nbsp;&nbsp; Critical Technologies, Inc.
Suite 400 Technology Center, 4th Floor 1001 Broad Street, Utica, NY 13501
315-793-0248&nbsp; x148&nbsp; &lt; bill.chappell@critical.com >&nbsp; www.critical.com</pre>
&nbsp;</html>

--------------D38CD0F57E0C742C76BFC822--


