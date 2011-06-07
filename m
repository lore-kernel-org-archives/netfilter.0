From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: [NFLOG] How to determine the connection a packet belongs to?
Date: Tue, 07 Jun 2011 17:55:02 +0530
Message-ID: <4DEE189E.8070403@linux.vnet.ibm.com>
References: <BANLkTimnO5UzNvq6SfuWc7osck=QL=HrMw@mail.gmail.com> <4DED6538.3090404@netfilter.org> <BANLkTi=7eDTNM+OEuDnZucX2sc4Bck_Q6w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=7eDTNM+OEuDnZucX2sc4Bck_Q6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: netfilter@vger.kernel.org

On 06/07/2011 04:10 PM, Clemens Eisserer wrote:
> Hi,
>
>> You can build the tuple from the packet in user-space to look up the
>> conntrack via libnetfilter_conntrack.
>
> How can I do that?
>
> Assuming there are two open connections:
> IP1:80<---->  IP2:39678
> IP1:39678<----->  IP2:80
>
> How can I know which packet belongs to which connection?
>
> Thanks, Clemens
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
Am not an expert, but can't you match the src and dst address/port in 
each packet?

Regards,
Seenu.
