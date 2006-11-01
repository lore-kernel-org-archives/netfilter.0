From: "" <chenggh04@st.lzu.edu.cn>
Subject: Re: Does anyone have the tool which could be used for protocol
Date: Wed, 01 Nov 2006 09:33:51 +0800
Message-ID: <362344831.02567@st.lzu.edu.cn>
Reply-To: chenggh04@st.lzu.edu.cn
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ged@jubileegroup.co.uk
Cc: netfilter@lists.netfilter.org

transmission?
Content-Type: text/plain


> I think your .edu establishment is trying to get you to think about it.
> 
> If you truly want to encapsulate TCP in UDP then you're going to have
> to find out what TCP does that UDP doesn't do.  There's no substitute
> for reading the documentation here, you can easily find what you need
> on the Web using Google (even in China:).

   Yes, I know I could use google and I think all chinese know google. And in
china there is a more popular search technology ISP named baidu than google. I
only want to get some  resolution method. 
   The simplest method is to programe with socket. I receive the TCP packet and
send  it out with UDP packet. It is ok. But if i implement it by myself I think
the efficiency is a problem.
   Yesterday I communicate with my friends about this problem. They suggest the
tunnel proxy may be a good method. When I need to transform the TCP to UDP I could
encapsulate the UDP to the payload of TCP protocol. If I need to transfrom the UDP
to TCP I could encapsulate the TCP to the payload of UDP protocol. I think it is a
good suggestion.
   Because I have ever done some work about IPv6. In Ipv6 over IPv4 they use
tunnel 
   I don't like anyone to teach me how to code or programe and I only want to get
a solution. :)

> Then you're going to have to come up with some code which can take a
> TCP connection and transmit/receive/maintain all the data, status etc.
> associated with it over some medium (I gues it doesn't matter what the
> medium is?) using UDP so that your code makes up for what UDP lacks.
> (Hint: TCP is intended to be a 'reliable' protocol, UDP is not.)
   
  Thank you. In every textbook it tells us the TCP reliable but UDP is not even in
Chinese textbook. :)

> OpenVPN for example can do this, it might help you to look at that
> project.  I think this is well Off Topic for the netfilter List.
   
   OpenVPN may be a good method. But I think it is too complex for my project. I
like the simple solution. 
   In the end. Thank you very much :)
   Best wishes.
                                                  cheng



