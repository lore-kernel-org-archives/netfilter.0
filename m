From: "Mitesh P Choksi" <murli@icafe.co.tz>
Subject: Re: [Fwd: SNAT to allocat IP from an IP Pool]
Date: Tue, 1 Oct 2002 14:36:58 +0300 (EAT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <43064.64.86.49.17.1033472218.squirrel@www.icafe.co.tz>
References: <20020930212955.BQLE28874.mta06-svc.ntlworld.com@there>
Reply-To: murli@icafe.co.tz
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020930212955.BQLE28874.mta06-svc.ntlworld.com@there>
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
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

I *also* need DNAT to allow connections in to those users, initiated  from
the Internet end of the link.

Antony Stone said:
> On Monday 30 September 2002 10:17 pm, Mitesh P Choksi wrote:
>
>> I keep changing my question based on what I learn from this list and
>> from the other articles on the net regarding netfilter.
>>
>> As I mentioned in my first email, I had dial-up users, then I
>> mentioned that I had LAN users, actually I have dial-up users on the
>> RAS being allocated private ip along with other LAN users who have
>> private IP as well. All in all I have /24 for all the users.
>> But, I have only 16 public IP address to spare and share among the /24
>> private IP addresses.
>
> This is still not an answer to my question (and that fact that you are
> changing your question as the emails proceed is probably contributing
> to my  confusion).
>
> Please answer this question:
>
> Do you *only* need SNAT so that your internal clients (I don't care
> whether  they're LAN users or dial-up users) can access things out on
> the Internet, or  do you *also* need DNAT to allow connections in to
> those users, initiated  from the Internet end of the link ?
>
> Antony.
>
> --
>
> Most people are aware that the Universe is big.
>
> - Paul Davies, Professor of Theoretical Physics




