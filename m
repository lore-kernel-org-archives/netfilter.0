From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: using iptables by normal user - not gui
Date: Thu, 24 Nov 2005 19:52:24 +0200
Message-ID: <4385FDD8.8090707@gmail.com>
References: <2622.192.168.1.115.1132849271.squirrel@webmail.piekna.pl>
	<65aa6af90511240759k1564b527u8f7d2edde763aefe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af90511240759k1564b527u8f7d2edde763aefe@mail.gmail.com>
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

Edmundo Carmona wrote:

>have you checked doing it with sudo? I think you can set what user can
>execute a given command (iptables in this case).
>
>On 11/24/05, Daniel Chojecki <boka@piekna.pl> wrote:
>  
>
>>Hi,
>>
>>i would like to give access to iptables to one user in my system.
>>
>>Is it possible and how to setup my system to allow it ?
>>
>>    
>>
man 5 sudoers

