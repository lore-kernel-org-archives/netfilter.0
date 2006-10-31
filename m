From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Does anyone have the tool which could be used for protocol
 transmission?
Date: Tue, 31 Oct 2006 15:15:50 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0610311503440.3740@mail3.jubileegroup.co.uk>
References: <200610311402.k9VE1neX001537@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200610311402.k9VE1neX001537@mail3.jubileegroup.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,

On Tue, 31 Oct 2006 chenggh04@st.lzu.edu.cn wrote:

> Now I have a project. In this project I have to transmit the TCP
> protocol into UDP protocol. [...]  I want to know if you have the better
> resolution or good protocol transmisson tool?

I think your .edu establishment is trying to get you to think about it.

If you truly want to encapsulate TCP in UDP then you're going to have
to find out what TCP does that UDP doesn't do.  There's no substitute
for reading the documentation here, you can easily find what you need
on the Web using Google (even in China:).

Then you're going to have to come up with some code which can take a
TCP connection and transmit/receive/maintain all the data, status etc.
associated with it over some medium (I gues it doesn't matter what the
medium is?) using UDP so that your code makes up for what UDP lacks.
(Hint: TCP is intended to be a 'reliable' protocol, UDP is not.)

OpenVPN for example can do this, it might help you to look at that
project.  I think this is well Off Topic for the netfilter List.

73,
Ged.

