From: Samuel Jean <sj-netfilter@cookinglinux.org>
Subject: Re: mails not coming thru'
Date: Sun, 05 Dec 2004 09:04:40 -0500
Message-ID: <41B31578.6050106@cookinglinux.org>
References: <f02e560404120501483864a165@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f02e560404120501483864a165@mail.gmail.com>
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
To: Varun Pabrai <varunsaa@gmail.com>, netfilter@lists.netfilter.org

Varun Pabrai wrote:

>Then I added rules using packet filtering for 
>sending and recieving mails as follows :
>
>accept if network protocol is TCP and destination port is 110
>  
>
add: accept if network protocol is TCP and source port is 110

>accept if network protocol is TCP and destination port is 25
>  
>
add: accept if network protocol is TCP and source port is 25

>saved and applied configuration and rebooted.
>
>But I am not able to send or recieve mails on client 
>machines. Why ?
>  
>
What happens is (I guess) your mailserver receives the packet, but when
answering, it gets dropped because the source port is now 25.

Same thing for your POP server.

>Anybody has any idea please help.
>  
>
HTH,

Samuel

