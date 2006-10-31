From: "" <chenggh04@st.lzu.edu.cn>
Subject: Does anyone have the tool which could be used for protocol
	transmission?
Date: Tue, 31 Oct 2006 12:35:49 +0800
Message-ID: <362269349.29086@st.lzu.edu.cn>
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
To: netfilter@lists.netfilter.org

Hi, everyone:
	Now I have a project. In this project I have to transmit the TCP protocol into
UDP protocol. The basic structure is like this:
	1    tcp    2    udp     3   tcp  4  MyProject
	1                   tcp 		   4  in common
	In common when the 1 and 4 communicate with each other they use tcp/ip protocol.
But in my project because of some reasons I have to add 2 proxies in this line
such as 2 and 3 based on udp protocol.
	I want to know if you have the better resolution or good protocol transmisson
tool?
	Best wishes.
	Thank you.
				                  		cheng



