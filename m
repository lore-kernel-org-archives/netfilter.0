From: "Jianqing Zhang" <arrow.jianqing@gmail.com>
Subject: Netlink programming problem
Date: Fri, 31 Oct 2008 02:32:05 -0500
Message-ID: <8a38e1330810310032i63da7c19l74b71b6a8a05c5fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=6F5HN9xS5mj2E/vP0ZYOB8IH5z4i5SOYechmj46n7Yo=;
        b=FpDuzfaLdlK/OVt4nFDKMBzbschQR9yeadcE/qUNUhqCGU8h++WoNW5jA93aIhyIeM
         mafwy2dBErbbv1UowkVE9Y4/AF/64P2sqQ9+D3VMd07vu7Zs24azUefcssgvZKYQsLpn
         0ec7VFkrKF96IJ2LEK8tjnMwUDRa0YHXgREdE=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I try to use netlink to receive (retrieve) the packets which are
stored in QUEUE by iptables.

However, every time when recvfrom() is executed, my program will get a
message (ipq_packet_msg) whose length is 0.
After apply iptables rules, I'm sure the filtered (ICMP) packets are
not passed to network stack anymore, but my program seems not get the
message. Following is my program, is there something wrong? I
appreciate your suggestions:

===================================
	struct sockaddr_nl addr_nl;
	struct nlmsghdr *nl_hdr = NULL;
	struct ipq_mode_msg *mode_data = NULL;
	struct ipq_packet_msg *pkt_data = NULL;
	struct ipq_verdict_msg *ver_data = NULL;
	socklen_t len;
	
	buffer1 = (void *)malloc(BUF_SIZE);
	buffer2 = (void *)malloc(BUF_SIZE);	

	if ((netlink_sockfd = socket(PF_NETLINK, SOCK_RAW, NETLINK_FIREWALL)) < 0){
		perror("socket(): fail to open NETLINK_FIREWALL socket\n");
		exit(1);
	}
	
	/* set up the socket address structure */
	memset(&addr_nl,0,sizeof(struct sockaddr_nl));
	addr_nl.nl_family = AF_NETLINK;
	addr_nl.nl_pid = 0; /* packets are destined for the kernel */
	addr_nl.nl_groups = 0; /* no any multicast groups*/
	
	/* We need establish the operational mode to the queue by sending a
mode message,
	 * so fill out the nlmsghdr structures as such.
	 */
	nl_hdr = (struct nlmsghdr *)buffer1;
	nl_hdr->nlmsg_type = IPQM_MODE;
	nl_hdr->nlmsg_len = NLMSG_LENGTH(sizeof(struct ipq_mode_msg));
	nl_hdr->nlmsg_flags = NLM_F_REQUEST; // A request, no answer required
	nl_hdr->nlmsg_pid = getpid();
	nl_hdr->nlmsg_seq = seq++; /*arbitrary unique value to allow response
correlatio */
	mode_data = (struct ipq_mode_msg *)NLMSG_DATA(nl_hdr);/* return a
pointer to the payload associated with the passed nlmsghdr*/
	mode_data->value = IPQ_COPY_META; /* sends only metadata about the
frame to userspace */
	mode_data->range = 0; /* copy whole packet */
	
	cout << "Sending MODE message... " << endl;
	if(sendto(netlink_sockfd, (void *)nl_hdr,nl_hdr->nlmsg_len,0,(struct
sockaddr *)&addr_nl,
			sizeof(struct sockaddr_nl)) < 0) {
		perror("sendto():unable to send mode message");
		exit(1);
	}
	
	len = sizeof(addr_nl);

  while(1){
		/* Wait for incoming packet... */
		if(recvfrom(netlink_sockfd, buffer1, NLMSG_LENGTH(sizeof(struct
ipq_packet_msg)),0,
				(struct sockaddr *)&addr_nl, &len) < 0) {
			perror("recvfrom():error occurred when receiving packet messages");
			exit(1);
		}
		
		total_callback++;
		/* once we have the packet message, extract the header and ancillary data */
		nl_hdr = (struct nlmsghdr *)buffer1;
		pkt_data = (struct ipq_packet_msg *)NLMSG_DATA(nl_hdr);
		
		if (pkt_data->data_len > 0){
			print_mac_addr(pkt_data->hw_addr);
			cout << "data_len is " << dec << pkt_data->data_len << endl;
		}
			
		/* Output some information of the packet */
		
		/* For the example, just forward all packets */
		/* Fill out a new nlmsgehdr structure */
		nl_hdr = (struct nlmsghdr *)buffer2;
		nl_hdr->nlmsg_type = IPQM_VERDICT; // Release the packet from ip_queue
		nl_hdr->nlmsg_len = NLMSG_LENGTH(sizeof(struct ipq_verdict_msg));
		nl_hdr->nlmsg_flags = NLM_F_REQUEST; // A request, no answer required
		nl_hdr->nlmsg_pid = getpid();
		nl_hdr->nlmsg_seq = seq++;
		ver_data = (struct ipq_verdict_msg *)NLMSG_DATA(nl_hdr);
		ver_data->value = NF_ACCEPT; // Send the packet through on the
network stack without any further iptables tests
		ver_data->id = pkt_data->packet_id;
		
		if(sendto(netlink_sockfd,(void *)nl_hdr,nl_hdr->nlmsg_len,0,(struct
sockaddr *)&addr_nl,
				sizeof(struct sockaddr_nl)) < 0 ){
			perror("sendto():unable to send the packet back to networ stack");
			exit(1);
		}
  }
